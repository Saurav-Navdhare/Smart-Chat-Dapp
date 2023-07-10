// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract ChatApp {

    struct user {
        string name;
        friend[] friendList;
    }

    struct friend {
        string name;
        address pubKey;
    }

    struct message{
        address sender;
        string message;
        uint256 timestamp;
    }

    struct allUsers {
        string name;
        address accountAddress;
    }

    allUsers[] getAllUsers;

    mapping (address => user) userList;
    mapping (bytes32 => message[]) messageList;

    // User Exists
    function checkUserExists(address key)  public view returns (bool) {
        return bytes(userList[key].name).length > 0;
    }

    // create account
    function createAccount(string calldata name) external {
        require(!checkUserExists(msg.sender), "User already exists");
        require(bytes(name).length > 0, "Name cannot be empty");
        userList[msg.sender].name = name;
        getAllUsers.push(allUsers(name, msg.sender));
    }

    // get username
    function getUsername(address key) external view returns (string memory) {
        require(checkUserExists(key), "User does not exist");
        return userList[key].name;
    }

    // add friend
    function addFriend(address friendKey, string calldata name) external {
        require(checkUserExists(msg.sender), "Create account first");
        require(msg.sender != friendKey, "Cannot add yourself as friend");
        require(checkUserExists(friendKey), "User not registered");
        require(checkAlreadyFriend(msg.sender, friendKey), "Already friends");

        _addFriend(msg.sender, friendKey, name); 
        _addFriend(friendKey, msg.sender, userList[msg.sender].name);
    }

    // check already friend
    function checkAlreadyFriend(address pubKey1, address pubKey2) internal view returns (bool) {
        if(userList[pubKey1].friendList.length > userList[pubKey2].friendList.length){
            address tmp = pubKey1;
            pubKey1 = pubKey2;
            pubKey2 = tmp;
        }

        for(uint i = 0; i < userList[pubKey1].friendList.length; i++){
            if(userList[pubKey1].friendList[i].pubKey == pubKey2){
                return true;
            }
        }
        return false;
    }

    // add friend
    function _addFriend(address pubKey1, address pubKey2, string memory name) internal {
        userList[pubKey1].friendList.push(friend(name, pubKey2));
    }

    // get friend list
    function getFriendList(address key) external view returns (friend[] memory) {
        require(checkUserExists(key), "Create account first");
        return userList[key].friendList;
    }

    // get chat code
    function _getChatCode(address pubKey1, address pubKey2) internal pure returns (bytes32) {
        if(pubKey1 < pubKey2){
            return keccak256(abi.encodePacked(pubKey1, pubKey2));
        }
        return keccak256(abi.encodePacked(pubKey2, pubKey1));
    }

    // send message
    function sendMessage(address friendKey, string calldata _msg) external {
        require(checkUserExists(msg.sender), "Create account first");
        require(checkUserExists(friendKey), "User not registered");
        require(!checkAlreadyFriend(msg.sender, friendKey), "Not friends");
        bytes32 chatCode = _getChatCode(msg.sender, friendKey);
        messageList[chatCode].push(message(msg.sender, _msg, block.timestamp));
    }

    // read message
    function readMessage(address friendKey) external view returns (message[] memory) {
        require(checkUserExists(msg.sender), "Create account first");
        require(checkUserExists(friendKey), "User not registered");
        require(!checkAlreadyFriend(msg.sender, friendKey), "Not friends");
        bytes32 chatCode = _getChatCode(msg.sender, friendKey);
        return messageList[chatCode];
    }

    // get all users
    function getAllUsersList() external view returns (allUsers[] memory) {
        return getAllUsers;
    }
}