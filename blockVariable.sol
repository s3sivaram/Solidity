pragma solidity ^0.6.0;

contract blockVariable{
    
    uint256 public blockDifficulty;
    uint256 public blockNo;
    address public coinbase;
    uint256 public gasLimit;
    
    
    function getBlockVariables() public{
        
        blockDifficulty = block.difficulty;
        blockNo = block.number;
        coinbase = block.coinbase;
        gasLimit = block.gaslimit;
    }
}
