// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.30; // grater than 30 
// @custom:dev-run-script NatSpec
// contract SimpleStorage {
//     bool isLong;
//     uint stringNumber = 42;
//     int limitOfMsg = 20;
//     address metaMask = 0x0790248b39886759cA52dfCf44801E5AC0414c4f;

// }

contract SimpleStorage{
    function getBytes() public pure returns (bytes memory, bytes8, bytes32){
        bytes memory dynamicBytes = bytes("cat");
        bytes8 fixedBytes8 = "cat";
        // bytes2 fixedBytes2 = "cat";
        bytes32 fixedBytes32 = "cat";
        return (dynamicBytes, fixedBytes8, fixedBytes32);
    }
}
