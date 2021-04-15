//SPDX License-identifier:MIT
pragma solidity ^0.6.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract ERC20Impl  is ERC20{
    
    uint public tokenamount;
    
    constructor (string memory name, string memory symbol) 
        public ERC20(name,symbol){}
    
    function mint1(address account, uint256 amount) public {
        _mint(account,amount);
        
    }
    
    
}
