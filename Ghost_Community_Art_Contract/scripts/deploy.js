async function main() {
    const GhostsProject = await ethers.getContractFactory("ghostforking")
    const Ghost_ai_art = await ethers.getContractFactory("ghost_community_art")
  
    // Start deployment, returning a promise that resolves to a contract object
    const ghostsProject = await GhostsProject.deploy()
    const ghost_ai_art = await Ghost_ai_art.deploy()
    await ghostsProject.deployed()
    await ghost_ai_art.deployed()
    console.log("Contract deployed to address:", ghostsProject.address)
    console.log("Contract deployed to address:", ghost_ai_art.address)
  }
  
  main()
    .then(() => process.exit(0))
    .catch((error) => {
      console.error(error)
      process.exit(1)
    })
  