/**
 * https://hardhat.org/tutorial/testing-contracts.html
 * 큰 단위의 테스트는 describe로 나누고 그 안의 작은 단위 들은 it을 통해 나눈다.
 * ghost의 경우 
 * describe는 ghost forking contract, ghost forking Deployment,ghost forking transcation
 * ghost ai art contract, ghost ai art Deployment, ghost forking transaction으로 나눈다. 
 */

const { expect } = require("chai");
const { ethers } = require("hardhat");


describe("GhostsProject contract", function () {
  it("GhostsProject contract deploy", async function () {

    let Token;
    let ghostnft;
    let owner;
    let addr1;
    let addr2;
    let addrs;

    beforeEach(async function () {
      Token = await ethers.getContractFactory("ghostforking");
      [owner, addr1, addr2, ...addrs] = await ethers.getSigners();

      ghostnft = await Token.deploy();
    });
  });
});
describe("GhostsProject Deployment", function () {

});

describe("GhostsProject transcation", function () {

});