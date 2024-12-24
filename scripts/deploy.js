const hre = require("hardhat");

async function main() {
    // Get the contract factory
    const TimeCapsule = await hre.ethers.getContractFactory("TimeCapsule");

    // Deploy the contract
    const timeCapsule = await TimeCapsule.deploy();

    // Wait for the transaction to be mined
    console.log("Deploying TimeCapsule...");
    await timeCapsule.waitForDeployment();

    // Get the deployed contract address
    const contractAddress = timeCapsule.target;
    console.log("TimeCapsule deployed to:", contractAddress);
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
