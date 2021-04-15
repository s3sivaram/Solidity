const Web3=require('web3');
// url to local host : http://127.0.0.1:8545
const url='http://127.0.0.1:8545';
web3=new Web3(url)
const ganacheAcc1 = '0x59c4Cc5f745cfd9CB4052DA64DbF12D0e458693C';

const ganacheAcc2= '0x90c826887aaa2509f343ecfebF7D83D608EA7623';

const balfunc=(err,bal)=>{
    console.log(bal);
};

//web3.eth.getBalance(ganacheAcc1,balfunc);

web3.eth.sendTransaction({from:ganacheAcc1,to:ganacheAcc2,value:web3.utils.toWei('5','ether')})
.then ((promise) => {console.log('promise',promise)});

web3.eth.getBalance(ganacheAcc2,balfunc);
