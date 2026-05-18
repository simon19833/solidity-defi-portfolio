# Day 15 — NFT Contract

A mintable NFT collection with supply limit and mint price.

## What It Does
- Users mint NFTs by paying ETH
- Maximum supply enforced on-chain
- Owner can withdraw collected ETH
- Each NFT has a unique token ID

## Contract Deployed on Sepolia
- NFT: 0x04c3C8684BfCEDe563b323Bf00b02341Dfd3c6f2

## Concepts Used
- ERC721 standard
- OpenZeppelin Ownable
- onlyOwner modifier
- payable functions
- ETH withdrawal pattern
