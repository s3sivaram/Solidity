//SPDX-License-Identifier:MIT

/* ---------------------- s3sivaram---------------

This contract explains the difference between call and delegate call :
consequences - delegate call runs the code of the calling contract but writes in the calledContract storage slot.

callingContract variable "callingVarString1" can be updated by updating the calledContract variable "calledVarString1"


------------------------------------------------*/

pragma solidity ^0.6.0;

contract callingContract{
    
    string public callingVarString1;
    uint public  callingVarInteger1;
    
    function getVarFunction(string memory _callingVarString1, uint _callingVarInteger1) public{
        callingVarString1 = _callingVarString1;
        callingVarInteger1 = _callingVarInteger1;
    }
    
    /* -----------------------------
    
    this CALL will not affect the callingContract variables at all.
    --------------------------------*/
    
    function usingCallFunction(address _calledContractAddress,string memory _calledVarString1) public {
        
        (bool callSent,bytes memory callData) = 
        _calledContractAddress.call(abi.encodeWithSignature("modifiyVarFunction(string)", _calledVarString1));
        
    }
    
    /* -----------------------------
    
    this DELEGATECALL will not affect the callingContract variables - callingVarString1 when the call
    updates the variables at the calledContract.
    --------------------------------*/
    
    
    function usingDelegateCallFunction(address _calledContractAddress,string memory _calledVarString1) public {
        
        (bool delegateCallSent,bytes memory delegateCallData) = 
        
        _calledContractAddress.delegatecall(abi.encodeWithSignature("modifiyVarFunction(string)", _calledVarString1));
        
    }
    
    
}


contract calledContract{
    
    string public calledVarString1;
    uint public  calledVarInteger1;
    
    function getVarFunction(string memory _calledVarString1, uint _calledVarInteger1) public{
        calledVarString1 = _calledVarString1;
        calledVarInteger1 = _calledVarInteger1;
    } 
    
    function modifiyVarFunction(string memory _calledVarString1) public {
        calledVarString1 = _calledVarString1;
        
    }
}
