// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.30; // grater than 30 

contract SimpleStorage {
    address metaMask = 0x0790248b39886759cA52dfCf44801E5AC0414c4f;
    uint256 public nbr;
    string  public newStr = "im string";
    bytes8 public lala = "working";

//updare nbr with input nbr
    function updateNbr(uint256 newNbr) public {
        nbr = newNbr;
    }
//to see what bytes will return
// pure function can not read from state or env and can not write
    function getBytes() public pure returns (bytes memory, bytes8, bytes32, string memory){
        bytes memory autoCntBytes = bytes("bytes");
        bytes8 fixedBytes8 = "bytes";
        bytes32 fixedBytes32 = "bytes";
        // string memory notWorks = newStr; //not working needs to be view
        string memory str = "bytes";
        return (autoCntBytes, fixedBytes8, fixedBytes32, str);
    }
//updating with global var i can access state bcs view ,method 
    function something() public view returns (bytes8){
         bytes8 fixedBytes8 = lala;
        //  bytes32 fix32 = newStr;//diff types
         return (fixedBytes8);
    }
}