const hre = require("hardhat");

async function main() {
  const ChatApp = await hre.ethers.getContractFactory("ChatApp");
  const chatApp = await ChatApp.deploy();
  await chatApp.waitForDeployment();

  console.log(
    `Contract address ${chatApp.target}`
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
