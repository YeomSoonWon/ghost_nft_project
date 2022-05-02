require('dotenv').config();
//API URL 컨트랙트 저장된 메인넷의 RPC URL로 수정
const API_URL = process.env.API_URL;
//
const PUBLIC_KEY = process.env.PUBLIC_KEY;
const PRIVATE_KEY = process.env.PRIVATE_KEY;

const { createAlchemyWeb3 } = require("@alch/alchemy-web3");
const web3 = createAlchemyWeb3(API_URL);

//컨트랙트 json 파일 추가 및 경로 설정
const contract = require("../artifacts/contracts/MyNFT.sol/MyNFT.json");
// 컨트랙트 address 추가
const contractAddress = "";
const nftContract = new web3.eth.Contract(contract.abi, contractAddress);

async function mintNFT(tokenURI) {
  const nonce = await web3.eth.getTransactionCount(PUBLIC_KEY, 'latest'); //get latest nonce

//the transaction
  const tx = {
    'from': PUBLIC_KEY,
    'to': contractAddress,
    'nonce': nonce,
    'gas': 500000,
    'data': nftContract.methods.mintNFT(PUBLIC_KEY, tokenURI).encodeABI()
  };
}​
