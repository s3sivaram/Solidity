//SPDX-License-Identifier:MIT

/*-----------------------------s3sivaram----------

1: Person1 creates an ERC20 token and owns some tokens - Filename : ERC20ofPerson1.
2: Person2 creates an ERC20 token and owns some tokens - Filename :ERC20ofPerson2.
3: Both Persons gives the some tokens as allowance to Escow contract - Filename :ERC20Escrow.
4: Escrow contract transfers those allowances to the Person1 and Person2 at the same time and honoring the agreement.



--------------------------------------------------*/


pragma solidity ^0.6.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";


contract ERC20Escrow{
    
    IERC20 public person1Token;
    IERC20 public person2Token;
    
    uint256 public person1Amount;
    uint256 public person2Amount;
    
    address public person1Address;
    address public person2Address;
    
    uint public person2allowance;
    uint public person1allowance;
    
    
    function getParty1Detail(address a1,uint a1Amount) public {
        
        person1Address = a1;
        person1Amount = a1Amount;
        
    }
    
    function getParty2Detail(address a2,uint a2Amount) public {
        
        person2Address = a2;
        person2Amount = a2Amount;
        
    }
    
    function checkAllowanceOfEscrowAccount() public{
        
       
        
        //function allowance(address owner, address spender) 
        
        person2allowance = person1Token.allowance(person1Address,person2Address);
        person1allowance = person2Token.allowance(person1Address,person2Address);
        
        
        
        
    }
}
