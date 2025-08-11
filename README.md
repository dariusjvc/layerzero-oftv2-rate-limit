# LayerZero OFTv2 Rate Limited

An ERC20 cross-chain token built with LayerZero OFTv2, featuring a simple daily transfer limit for enhanced security.

## Overview
This project demonstrates how to create a cross-chain ERC20 token using LayerZero's OFTv2 standard with a **daily rate limiter** to prevent excessive transfers.  
The contract allows transfers between EVM-compatible chains via LayerZero.

## Features
- ERC20 with LayerZero OFTv2
- Daily transfer limit (default 1000 tokens/day)
- Owner can adjust the limit
- Ready for deployment on Sepolia and Polygon

## Prerequisites
- Node.js v18+
- Hardhat
- A LayerZero endpoint address for your target network

## Install
```bash
npm install
