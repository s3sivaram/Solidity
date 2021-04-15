/*-----------------------------s3sivaram---------------------------------*/

/* Signing a transaction & broadcasting to the Rinkeby Network

store the private key of rinkeby at the systems ENVIRONMENT variable list.

set private = 'PRIVATE KEY' of the signer account in the command prompt.

'echo %private% ' to display the variable in the command prompt.

Use the Resultant txHash in the rinkeybyetherscan to verify the Transaction. */

/*-----------------------------------------------------------------------*/

const Web3=require('web3');
const Tx=require('ethereumjs-tx').Transaction;


URL = "https://rinkeby.infura.io/v3/2f85a9b7f45b432882fd7cf26eeb4819";
web3= new Web3(URL);

// Read the private key from the ENVIORNMENT variable
const PKey11=process.env.private;

/* Buffer the PRIVATE KEY to hex & reduce it to 32 bytes */
const Pkey1=Buffer.from(PKey11,'hex');

/* Address1 & Address2 are the test accounts in Rinkeby network */
const Address1 ='0x7eCbDa34C878a802b120b3268a5A8294EFa88b25';
const Address2='0x8A2650628463f7FaBbFFB9319Ef8F72Aa04d57E5';

/* Get the transaction count of the Address1 in txCount and then fill up the txObject */

web3.eth.getTransactionCount(Address1,(err,txCount)=>{
    
    const txObject={
        nonce:web3.utils.toHex(txCount),
        to:Address2,
        value:web3.utils.toHex(web3.utils.toWei('2','ether')),
        gasLimit:web3.utils.toHex(21000),
        gasPrice:web3.utils.toHex(web3.utils.toWei('10','gwei'))
    }
    
    /*  the chain property is added to the txObject without which it defaults to mainnet*/
    const tx = new Tx(txObject,{'chain':'rinkeby'});
    tx.sign(Pkey1);

    const serializedTransaction=tx.serialize()
    const raw ='0x' + serializedTransaction.toString('hex');

    web3.eth.sendSignedTransaction(raw,(err,txhash)=>{
    console.log('txhash',txhash)
    console.log('error',err)
    })

})
