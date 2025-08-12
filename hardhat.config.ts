import { HardhatUserConfig } from "hardhat/config";

import * as dotenv from "dotenv";

import "@nomiclabs/hardhat-ethers"; // v5
import "@nomicfoundation/hardhat-chai-matchers";
import "@nomicfoundation/hardhat-verify";

dotenv.config();

const config: HardhatUserConfig = {
  solidity: {
  version: "0.8.19",
  settings: {
    optimizer: { enabled: true, runs: 50 }, // runs bajos = menor tamaño de deploy
    viaIR: true                              // suele reducir aún más el bytecode
  }},
  networks: {
    sepolia: {
      url: process.env.SEPOLIA_RPC || "",
      accounts: process.env.PRIVATE_KEY ? [process.env.PRIVATE_KEY] : [],
      chainId: 11155111 
    },
    amoy: {
      url: process.env.AMOY_RPC || "",
      accounts: process.env.PRIVATE_KEY ? [process.env.PRIVATE_KEY] : [],
      chainId: 80002 // Amoy testnet
    }
  }
};

export default config;
