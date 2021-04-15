pragma solidity ^0.6.0;

contract originalContract{
    
    uint256 public originalContractVar1;
    //address public Addrs;
    
    function setVariableValueInOriginalContract() public{
        
        originalContractVar1 += 1;
    }
    
}


contract attackContract{
    
    address public Addrs = address(0xDA07165D4f7c84EEEfa7a4Ff439e039B7925d3dF);

    originalContract orgContract;
    
   /* constructor(originalContract _orgContract) public{
        orgContract = originalContract(_orgContract);
        orgContract.setVariableValueInOriginalContract();
    }*/
    
    function setAddressFunction() public {
        orgContract = originalContract(Addrs);
        orgContract.setVariableValueInOriginalContract();
    }
    
    
}
