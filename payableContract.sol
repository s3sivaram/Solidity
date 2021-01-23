pragma solidity ^0.6.0;

contract payableContract {
    
    address public payingAddress;
    uint256 public contractBalance;
    address payable public toAddress = payable(address(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4));
    uint256 public toAddressBalance;
    
    
    event log(string);
    
    function payFunction() public payable{

        payingAddress = msg.sender;
        contractBalance = address(this).balance;
        

    }
    
    function transferFund()  public{
        //toAddress = payable(address(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4));
        toAddress.transfer(2 ether);
        toAddressBalance = toAddress.balance;
        
    }    
}
