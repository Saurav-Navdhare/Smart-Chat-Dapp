import {ethers} from "ethers";
import Web3Modal from 'web3modal';

import { ChatAppAddress, ChatAppABI } from "../Context/constants.js";

export const CheckIfWalletConnected = async () => {
    try {
        if(!window.ethereum) return console.log("No wallet detected")
        const accounts = await window.ethereum.request({ method: 'eth_accounts' }) 
        const firstAccount = accounts[0]
        return firstAccount
    } catch (error) {
        console.log(error)
    }
}

export const ConnectWallet = async () => {
    try {
        if(!window.ethereum) return console.log("No wallet detected")
        const accounts = await window.ethereum.request({ method: 'eth_requestAccounts' })
        const firstAccount = accounts[0]
        return firstAccount
    } catch (error) {
        console.log(error)
    }
}