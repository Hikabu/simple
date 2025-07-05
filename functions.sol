// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.30; // grater than 30 
//recursive lenght prefix
contract createAddress{
    address senderAddress = 0xdEADBEeF00000000000000000000000000000000;
    bytes10 myKey = "verySecret";
    //to unite list
    struct trxInfo{
        uint256 day;
        string month;
    }
    //mapping
    mapping(uint256 => string ) public dayToMonth;
   //dynamic
    trxInfo[] public listOfInfo;
    // uint8 public nonce;
    function contractAddress(uint8 nonce) public view returns (address){
        bytes memory rlp;
        //no rlp.encoded function - fackinf with the abi
        if (nonce == 0){
            rlp = abi.encodePacked(
                bytes1(0xd5),
                bytes1(0x94),
                senderAddress, 
                bytes1(" ")
            );
            // zeroNonce();
        }
        else if (nonce <= 127 && nonce > 0){
            rlp = abi.encodePacked(
                bytes1(0xd5),
                bytes1(0x94),
                senderAddress, 
                bytes1(uint8(nonce))
            );
        }
        else
            revert("The nonce is to high to count it manually\n");
        
        //[0xd6][0x94][20-byte-address][1-byte-nonce] should be after abi
        //keccak tales the bytes memory andreturn hash 
        bytes32 hash = keccak256(rlp);
        //no need to take lat 20 bytes - this is the address
        //we need on;y last 20 bytes so can not just take the bytes20
        address finallyAddress = address(uint160(uint256(hash)));
        return finallyAddress;
    }

    function compare(uint8 nonce) private view returns (bool){
            address cmpr = contractAddress(nonce);
            bool equal = true;
            if (cmpr ==  senderAddress){
                revert("Wrong logic of rlp");
            }
            else 
                return equal;
        }
    function retrieve() public view returns (address){
        return senderAddress;
    }
    function addInfo(uint256 _day, string calldata _month) public {
        // trxInfo memory newInfo = trxInfo(_day, _month);
        listOfInfo.push(trxInfo(_day, _month));
        dayToMonth[_day] = _month;
    }
}

// contract useAddress is createAddress{
//     function call() public {
//         contractAddress(nonce);
//     }
// }