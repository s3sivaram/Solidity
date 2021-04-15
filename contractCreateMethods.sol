//SPDX License-idenitifier:MIT

/*----------------------------------s3sivaram------------


Example of contract created in two ways

1 : new contract which creates the code of the instantiated contract
2 : using the address of the already deployed contract.


--------------------------------------------------------*/

pragma solidity ^0.6.0;

contract main{
    
    string public testStr = "Test string in Main";
    uint testInt = 1;
    uint[] public valuesList;
    
    function getVar() public returns (uint) {
        
        testInt = testInt * 100;
        valuesList.push(testInt);
        
        return testInt;
    }
    
}

pragma solidity ^0.6.0;

import "../browser/mainContract.sol";

contract copy{
    
    uint public mainreturn;
    
    uint public copyaddressvar;
    
    main copy = new main();
    
    main public copyaddress;
    
   
    
    function copyFunction() public returns(string memory){
        mainreturn = copy.getVar();
    }
    
    function setcontractaddress(address oldAddres) public{
        
        copyaddress = main(oldAddres);    
        
        copyaddressvar=copyaddress.getVar();
    }
}
