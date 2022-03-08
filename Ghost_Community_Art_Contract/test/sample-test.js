const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("GhostsProject", function () {
  it("error invoked", async function () {
    const GhostsProject = await ethers.getContractFactory("GhostsProject");
    const GhostsProject_test = await GhostsProject.deploy();
    await GhostsProject_test.deployed();
    const GhostsProjectAddress = GhostsProject_test.address;
    console.log(GhostsProjectAddress)
  });
});
