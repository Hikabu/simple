// SPDX-License-Identifier: MIT 
//super for the parent 
pragma solidity ^0.8.24;
import {SimpleStorage} from "./simpleStorage.sol";
import {createAddress} from "./functions.sol";

contract complicateNonce is createAddress {
    function contractAddress(uint8 _level) public override view returns (address) {
        uint8 nonce  = (_level * _level + 8);
        return super.contractAddress(nonce);
    }
}