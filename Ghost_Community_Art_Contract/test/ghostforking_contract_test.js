/**
 * https://hardhat.org/tutorial/testing-contracts.html
 * 
 * 1.test 단위별 describe 생성.
 * 2.컨트랙트 연결 및 배포 코드 작성.
 * 3.함수 실행해보기.
 * 4.로컬 노드에 배포해보기.
 * 
 */

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

    const addr1Balance = await GhostsProject_test.balanceOf(addr1.address);
    const addr2Balance = await GhostsProject_test.balanceOf(addr2.address);

    console.log(ownerBalance)
    console.log(addr1Balance)
    console.log(addr2Balance)
  });
});

/**
 * ghost_community_art contract test
 * 
 */
 describe("ghost_community_art contract", function () {
  it("ghost_community_art contract error invoked", async function () {
    const [owner, addr1, addr2] = await ethers.getSigners();
    const ghost_community_art = await ethers.getContractFactory("ghost_community_art");
    const ghost_community_art_test = await ghost_community_art.deploy();

    const ghost_community_art_Address = ghost_community_art_test.address;
    console.log(ghost_community_art_Address)
    const ownerBalance = await ghost_community_art_test.balanceOf(owner.address);    
    console.log(ownerBalance)



  });
});