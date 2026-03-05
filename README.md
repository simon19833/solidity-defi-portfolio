# Token Vesting (Solidity)

A simple token vesting contract that locks ERC20 tokens until a release time, then transfers them to a beneficiary.
Tested on Sepolia using Remix + MetaMask.

## How it works
1) Deploy with:
- ERC20 token address
- beneficiary address
- release time (unix timestamp)

2) Approve tokens to the vesting contract
3) Fund the vesting contract
4) Release after the unlock time

## Files
- `contracts/TokenVesting.sol` — vesting contract
- `PROGRESS_LOG.md` — Sepolia transaction hashes (on-chain proof)

## On-chain proof
See `PROGRESS_LOG.md`.
