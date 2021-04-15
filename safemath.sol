pragma solidity ^0.6.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/math/SafeMath.sol";


contract payableContract{
    
    using SafeMath for uint;
    
    mapping( address => uint256) public balancesofAddress;
    mapping( address => uint256) public depositDateofAddress;
    uint256 public contractBalance;
    uint256 public Addition;
    uint256 public Addition1;
    bool public mulresult;
    
    event logDeposit(address indexed depAddress, uint depAmount,string message );
    event logWithDrawl(address indexed withdrawAddress,uint withdrawAmount,string message);
    
    function payFunction() public payable{
        
        balancesofAddress[msg.sender]=msg.value;
        
        contractBalance = address(this).balance;
        
        depositDateofAddress[msg.sender]=now;
        
        emit logDeposit(msg.sender,msg.value,"EMITTED DEPOSIT");
        
    }
    
    
    function withdrawlFunction() public payable{
        
        uint256 amountSentBack;
        
        amountSentBack = balancesofAddress[msg.sender];
        
        msg.sender.transfer(amountSentBack);
        
        logWithDrawl(msg.sender,amountSentBack,"WITHDRAWN AMOUNT");
        
    }
    
    function safeMathTest( uint256 firstNo,uint256 secondNo) public {
        
        Addition = firstNo * secondNo;
        Addition1 = firstNo.mul(secondNo);
        
        (mulresult,Addition1) = firstNo.tryMul(secondNo);
        
    }
    
}
