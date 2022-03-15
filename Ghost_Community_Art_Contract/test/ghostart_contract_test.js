const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("ghost ai art contract", function () {
    it("ghost ai art contract deploy", async function () {
  
      let Token;
      let ghostartnft;
      let owner;
      let addr1;
      let addr2;
      let addrs;
  
      beforeEach(async function () {
        Token = await ethers.getContractFactory("ghostart");
        [owner, addr1, addr2, ...addrs] = await ethers.getSigners();
  
        ghostartnft = await Token.deploy();
      });
    });
  });
  
  describe("ghost ai art Deployment", function () {
  
  });
  
  describe("ghost ai art transcation", function () {
  
  });
  