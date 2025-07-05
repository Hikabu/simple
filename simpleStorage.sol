// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.30; // grater than 30 

contract SimpleStorage {
    address metaMask = 0x0790248b39886759cA52dfCf44801E5AC0414c4f;
    uint256 public nbr;
    string  public newStr = "im string";
    bytes8 public lala = "working";

//updating with global var i can access state bcs view ,method 
    function something() public view returns (bytes8){
         bytes8 _fixedBytes8 = lala;
        //  bytes32 fix32 = newStr;//diff types
         return (_fixedBytes8);
    }
//to see what bytes will return
// pure function can not read from state or env and can not write
    function getBytes() public pure returns (bytes memory, bytes8, bytes32, string memory){
        bytes memory _autoCntBytes = bytes("bytes");
        bytes8 _fixedBytes8 = "bytes";
        bytes32 _fixedBytes32 = "bytes";
        // string memory notWorks = newStr; //not working needs to be view
        string memory _str = "bytes";
        return (_autoCntBytes, _fixedBytes8, _fixedBytes32, _str);
    }
//updare nbr with input nbr
    function updateNbr(uint256 _newNbr) public {
        nbr = _newNbr;
        // something();
    }
}
