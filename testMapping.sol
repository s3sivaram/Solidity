//SPDX License-Identifier:MIT
pragma solidity ^0.6.0;
contract testMapping{
    
    mapping(address => bool) public addressMap;
    bool public flag;
    
    mapping(address => mapping(address => bool)) public addressAddressMap;
    
    
    modifier isDuplicteAddress(address from,address to){
        
        bool _flag = addressAddressMap[from][to];
        
        require(!_flag);
        
        _;
        
    }
    
    
    function mapfunction(address _address) public {
        
        flag = addressMap[_address];
        
        require(!flag,"duplicate address");
        addressMap[_address] = true;
        
        
    }

    function addressAddressMapFunction(address _giveAccessAddress) isDuplicteAddress(msg.sender,_giveAccessAddress) public{
        
            addressAddressMap[msg.sender][_giveAccessAddress] = true;
    }
    
    
    
    
}
