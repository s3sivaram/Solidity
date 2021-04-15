//SPDX License-identifier:MIT
pragma solidity ^0.6.0;

contract tempMain{
    
    address public owner;
    string public parentstring;
    
    constructor(string memory _parentstring) public{
        
        owner = msg.sender;
        
        parentstring = _parentstring;
        
    }
}



contract tempchild is tempMain{
    
    string public somestring;
    
    constructor(string memory ) tempMain("SS") public{
        
        somestring = "populated inside child";
    }
        
        
    
}
