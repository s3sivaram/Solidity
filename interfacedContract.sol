//SPDX-License-Identifier:MIT
pragma solidity ^0.6.0;

contract interfacedContract{
    
    uint256 public incrementedNumber;
    
    function interfacedFunction(uint number) public returns (uint) {
        incrementedNumber = number +1;
        
        return incrementedNumber;
        
        
    }
    
}
