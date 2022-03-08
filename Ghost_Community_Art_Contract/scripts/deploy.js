async function main() {
    const GhostsProject = await ethers.getContractFactory("GhostsProject")
  
    // Start deployment, returning a promise that resolves to a contract object
    const ghostsProject = await GhostsProject.deploy()
    await ghostsProject.deployed()
    console.log("Contract deployed to address:", ghostsProject.address)
  }
  
  main()
    .then(() => process.exit(0))
    .catch((error) => {
      console.error(error)
      process.exit(1)
    })
  