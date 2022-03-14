async function main() {
    const GhostsProject = await ethers.getContractFactory("GhostsProject")
    const Ghostart = await ethers.getContractFactory("ghostart")
  
    // Start deployment, returning a promise that resolves to a contract object
    const ghostsProject = await GhostsProject.deploy()
    const ghostart = await Ghostart.deploy()
    await ghostsProject.deployed()
    await ghostart.deployed()
    console.log("Contract deployed to address:", ghostsProject.address)
    console.log("Contract deployed to address:", ghostart.address)
  }
  
  main()
    .then(() => process.exit(0))
    .catch((error) => {
      console.error(error)
      process.exit(1)
    })
  