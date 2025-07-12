// SPDX-License-Identifier: MIT
//orcistrate with conotracts and use the functions frmo different contracts
//created the instance if contract bu idexing addint the info and retrieving with the getters
//not useful better just to write one well mapped contract 
//deplloing (new)is expensive
pragma solidity ^0.8.24;
import {SimpleStorage} from "./simpleStorage.sol";

contract StorageFactory{
    SimpleStorage[] public listOfStorages;
    function createSimpleStorage() public {
        SimpleStorage pieceOfStorage = new SimpleStorage();
        listOfStorages.push(pieceOfStorage);
    }

    function updateNonce(uint256 _simpleStorageIndex, uint256 _newNonceNumber) public{
    // to interact with the contract in need  adddress and function selecto
        SimpleStorage mySimpleStorage = SimpleStorage(listOfStorages[_simpleStorageIndex]);
        mySimpleStorage.updateNbr(_newNonceNumber);
    }
    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256) {
        return SimpleStorage(listOfStorages[_simpleStorageIndex]).retrieve();
    }
}