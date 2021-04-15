const Web3=require('web3');

//----------------

const Rinkeby='https://rinkeby.infura.io/v3/2f85a9b7f45b432882fd7cf26eeb4819';
const RinkAddr1='0x7eCbDa34C878a802b120b3268a5A8294EFa88b25';
const RinkAddr2='0x8A2650628463f7FaBbFFB9319Ef8F72Aa04d57E5';

//---------------

const ropsten='';

const kovan='';

//--------------

const web3= new Web3(Rinkeby);
web3.eth.getBalance(RinkAddr2,(err,balance)=>{
    console.log('error',err);
    console.log('Balance is ',balance)
})
