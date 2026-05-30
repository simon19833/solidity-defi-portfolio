# Day 15 — NFT Contract

A mintable NFT collection with supply limit and mint price.

## What It Does
- Users mint NFTs by paying ETH
- Maximum supply enforced on-chain
- Owner can withdraw collected ETH
- Each NFT has a unique token ID

## Contract Deployed on Sepolia
- NFT: 0x86D459730b9F474904617264F3859efbE6767936

## Concepts Used
- ERC721 standard
- OpenZeppelin Ownable
- onlyOwner modifier
- payable functions
- ETH withdrawal pattern

## Day 16 Improvements
- Added setBaseURI() — owner sets metadata URL
- Added _baseURI() — returns base URL for all tokens
- tokenURI() now returns full metadata link per token
