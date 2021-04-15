//SPDX-License-Identifier:MIT

/*-----------------------------s3sivaram----------

1: Person1 creates an ERC20 token and owns some tokens - Filename : ERC20ofPerson1.
2: Person2 creates an ERC20 token and owns some tokens - Filename :ERC20ofPerson1.
3: Both Persons gives the some tokens as allowance to Escow contract - Filename :ERC20Escrow.
4: Escrow contract transfers those allowances to the Person1 and Person2 at the same time and honoring the agreement.



--------------------------------------------------*/


pragma solidity ^0.6.0;


import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract ERC20ofPerson1 is ERC20{
    
/*---------------Variables start------------------    */
    
address public owner;    
    
    
    
/*---------------Variables end------------------*/


    // pass the token name & symbol as the parameter
    
    constructor (string memory name, string memory symbol) public ERC20(name,symbol){
        
        owner = msg.sender;
        
    }
    
    modifier onlyOwner() {
        
        require (owner == msg.sender);
        
        _;
    }
    
    function F1mintTokens(uint tokenaAmount) public onlyOwner{
        
         _mint(owner, tokenaAmount);
        
    }
    
    
}
