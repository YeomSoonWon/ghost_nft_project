const { expect } = require("chai");
const { ethers,waffle} = require("hardhat");


/**
 * ghost forking contract test
 * 
 */
describe("GhostsProject contract", function () {
  it("GhostsProject contract error invoked", async function () {
    const [owner, addr1, addr2] = await ethers.getSigners();
    const GhostsProject = await ethers.getContractFactory("GhostsProject");
    const GhostsProject_test = await GhostsProject.deploy();
    const GhostsProjectAddress = GhostsProject_test.address;

    console.log(GhostsProjectAddress)

    const ownerBalance = await GhostsProject_test.balanceOf(owner.address);
    // await GhostsProject_test.connect(addr1).mintGhost(1)
    // await GhostsProject_test.connect(addr2).mintGhost(1)

    // const addr1Balance = await GhostsProject_test.balanceOf(addr1.address);
    // const addr2Balance = await GhostsProject_test.balanceOf(addr2.address);

    console.log(ownerBalance)
    // console.log(addr1Balance)
    // console.log(addr2Balance)
  });
});

/**
 * ghost_community_art contract test
 * 
 */
//  describe("ghost_community_art contract", function () {
//   it("ghost_community_art contract error invoked", async function () {
//     const [owner, addr1, addr2] = await ethers.getSigners();
//     const ghost_community_art = await ethers.getContractFactory("ghost_community_art");
//     const ghost_community_art_test = await GhostsProject.deploy();

//     const ghost_community_art_Address = GhostsProject_test.address;
//     console.log(ghost_community_art_Address)
//     const ownerBalance = await ghost_community_art_test.balanceOf(owner.address);
//     await ghost_community_art_test.connect(addr1).mintGhost()
//     await ghost_community_art_test.connect(addr2).mintGhost()

//   });
// });