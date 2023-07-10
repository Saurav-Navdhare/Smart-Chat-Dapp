[
  {
    "contractName": "ChatApp",
    "requests": [
      {
        "name": "checkUserExists",
        "input": [
          {
            "name": "pubkey",
            "type": "address"
          }
        ],
        "output": {
          "name": "exists",
          "type": "bool"
        }
      },
      {
        "name": "createAccount",
        "input": [
          {
            "name": "name",
            "type": "string"
          }
        ]
      },
      {
        "name": "getUsername",
        "input": [
          {
            "name": "pubkey",
            "type": "address"
          }
        ],
        "output": {
          "name": "username",
          "type": "string"
        }
      },
      {
        "name": "addFriend",
        "input": [
          {
            "name": "friend_key",
            "type": "address"
          },
          {
            "name": "name",
            "type": "string"
          }
        ]
      },
      {
        "name": "getMyFriendList",
        "output": {
          "name": "friends",
          "type": "friend[]"
        }
      },
      {
        "name": "sendMessage",
        "input": [
          {
            "name": "sender",
            "type": "address"
          },
          {
            "name": "friend_key",
            "type": "address"
          },
          {
            "name": "_msg",
            "type": "string"
          }
        ]
      },
      {
        "name": "readMessage",
        "input": [
          {
            "name": "friend_key",
            "type": "address"
          }
        ],
        "output": {
          "name": "messages",
          "type": "message[]"
        }
      },
      {
        "name": "getAllAppUser",
        "output": {
          "name": "users",
          "type": "AllUserStruck[]"
        }
      }
    ],
    "structures": [
      {
        "name": "user",
        "fields": [
          {
            "name": "name",
            "type": "string"
          },
          {
            "name": "friendList",
            "type": "friend[]"
          }
        ]
      },
      {
        "name": "friend",
        "fields": [
          {
            "name": "pubkey",
            "type": "address"
          },
          {
            "name": "name",
            "type": "string"
          }
        ]
      },
      {
        "name": "message",
        "fields": [
          {
            "name": "sender",
            "type": "address"
          },
          {
            "name": "timestamp",
            "type": "uint256"
          },
          {
            "name": "msg",
            "type": "string"
          }
        ]
      },
      {
        "name": "AllUserStruck",
        "fields": [
          {
            "name": "name",
            "type": "string"
          },
          {
            "name": "accountAddress",
            "type": "address"
          }
        ]
      }
    ],
    "data": [
      {
        "name": "getAllUsers",
        "type": "AllUserStruck[]"
      }
    ],
    "functions": [
      {
        "name": "checkUserExists",
        "requestType": "checkUserExists",
        "message": "Check if a user exists",
        "pure": true
      },
      {
        "name": "createAccount",
        "requestType": "createAccount",
        "message": "Create a user account"
      },
      {
        "name": "getUsername",
        "requestType": "getUsername",
        "message": "Get the username for a given address",
        "pure": true
      },
      {
        "name": "addFriend",
        "requestType": "addFriend",
        "message": "Add a friend to the user's friend list"
      },
      {
        "name": "getMyFriendList",
        "requestType": "getMyFriendList",
        "message": "Get the list of friends for the current user",
        "pure": true
      },
      {
        "name": "sendMessage",
        "requestType": "sendMessage",
        "message": "Send a message to a friend"
      },
      {
        "name": "readMessage",
        "requestType": "readMessage",
        "message": "Read messages from a specific friend",
        "pure": true
      },
      {
        "name": "getAllAppUser",
        "requestType": "getAllAppUser",
        "message": "Get all registered users"
      }
    ]
  }
]
