const hre = require("hardhat");

async function main() {
  const contractAddress = process.env.CONTRACT_ADDRESS;
  const recipientAddress = process.env.RECIPIENT_ADDRESS || (await hre.ethers.provider.getSigner()).address;
  const tokenURI = process.env.TOKEN_URI || "https://example.com/nft/1";

  if (!contractAddress) {
    console.error("Please set CONTRACT_ADDRESS in your .env file");
    process.exit(1);
  }

  console.log("Minting NFT...");
  console.log("Contract address:", contractAddress);
  console.log("Recipient address:", recipientAddress);
  console.log("Token URI:", tokenURI);

  const MyNFT = await hre.ethers.getContractFactory("MyNFT");
  const myNFT = MyNFT.attach(contractAddress);

  const tx = await myNFT.safeMint(recipientAddress, tokenURI);
  await tx.wait();

  console.log("NFT minted successfully!");
  console.log("Transaction hash:", tx.hash);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });