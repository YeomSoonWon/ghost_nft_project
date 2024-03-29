//https://hardhat.org/tutorial/testing-contracts.html

// 디버깅 툴
const { expect } = require("chai");
//ethers는 전역 변수로 사용할 수 있다.
const { ethers,console } = require("hardhat");

/**
 * npx hardhat test
 */
describe("GhostCops contract", function () {
  it("GhostCops contract error invoked", async function () {
    //getsingers는 이더리움 account를 나타내는 객체이다.
    const [owner] = await ethers.getSigners();
    // 컨트랙트를 가져온다.
    const GhostCops = await ethers.getContractFactory("GhostCops");
    // 컨트랙트를 배포한다.
    const GhostCops_test = await GhostCops.deploy();
    const GhostCopsAddress = GhostCops_test.address;
    console.log(GhostCopsAddress)
    
    //owner 계정의 balance를 가져온다.
    const ownerBalance = await hardhatToken.balanceOf(owner.address);
    
  });
});

describe("transaction", function () {
  it("transaction error invoked", async function () {
    //다른 계정 사용하기
    const [owner, addr1, addr2] = await ethers.getSigners();

    

  });
});
