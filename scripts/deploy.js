const hre = require("hardhat");

async function main() {
  console.log("Deploying MyNFT...");

  const MyNFT = await hre.ethers.getContractFactory("MyNFT");
  const myNFT = await MyNFT.deploy();

  await myNFT.waitForDeployment();

  console.log(`MyNFT deployed to: ${await myNFT.getAddress()}`);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });