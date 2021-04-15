//SPDX-License-Identifier:MIT
pragma solidity ^0.6.0;

interface interface1 {
    function interfacedFunction(uint number) external returns (uint);
}

contract interfacingContract{
    
    uint public newNumber;
    function getDetails(address interfaceAddress, uint number) public{
        
        // calling the interface function
        
        newNumber=interface1(interfaceAddress).interfacedFunction(number);
        
       
        
    }
    
}
