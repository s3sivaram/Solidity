// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract reEntrancyMain{
    
    
    uint public contractBalance;
    
    uint256 public withdrawAmount;
    
    address public withdrawAddress;
    
    mapping(address => uint) public addressBalanceMap;
    mapping(address => string) public addressNameMap;
    mapping(address => uint256) public addressTimeMap;
    
    event logSent(address , string);
    event logDeposit(address,string);
    
    function depositEther() public payable{
        
        contractBalance = address(this).balance;
        addressBalanceMap[msg.sender] = msg.value;
        emit logDeposit(msg.sender,"Ether Deposited into Contract");
        
        
    }
    
    function withDrawl(uint _withdrawAmount) public {
        
        //withdrawAmount = _withdrawAmount * 10 ** 18;
        
        require(_withdrawAmount > addressBalanceMap[msg.sender],"Insufficient fund in the vault");
        
        (bool sent,)=msg.sender.call{value: (_withdrawAmount)}("");
        
        require(sent,"Sending Ether back Failed");
        emit logSent(msg.sender,"ETHER sent back");
        
        addressBalanceMap[msg.sender] = addressBalanceMap[msg.sender] - withdrawAmount;
        withdrawAddress = msg.sender;
        
        contractBalance = address(this).balance;
        
        
    }
}
