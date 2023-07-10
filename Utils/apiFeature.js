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

const fetchContract = (signerOnProvider) => 
    new ethers.Contract(ChatAppABI, ChatAppAddress, signerOnProvider)

export const connectingWithContract = async () => {
    try {
        const web3modal = new Web3Modal()
        const connection = await web3modal.connect()
        const provider = new ethers.providers.Web3Provider(connection)
        const signer = provider.getSigner()
        const contract = fetchContract(signer)
        return contract
    } catch (error) {
        console.log(error)
    }
}

export const converTime = (time) => {
    const date = new Date(time.toNumber())
    const realTime = date.getHours() + "/" + date.getMinutes() + "/" + date.getSeconds() + " Date: " + date.getDate() + "/" + (date.getMonth() + 1) + "/" + date.getFullYear()
    return realTime
}