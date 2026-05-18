# Day 13 — Staking Contract

A DeFi staking contract where users lock tokens and earn rewards over time.

## What It Does
- Users stake ERC20 tokens
- Rewards accumulate based on time staked
- Owner funds the reward pool
- Users unstake and receive tokens + rewards

## Contracts Deployed on Sepolia
- Token:   0x086297E896CB5B6437CB917aB9230Ac5982FbF28
- Staking: 0xf5B6DE7dAd20Ad7a24aBc743aD000c7404e5554D

## Concepts Used
- CEI pattern (Checks, Effects, Interactions)
- block.timestamp for time tracking
- ERC20 transferFrom with approve
- Reentrancy protection

## Day 14 Improvements
- Fixed reward rate to 10% APY
- Added OpenZeppelin ReentrancyGuard
- Added nonReentrant to stake() and unstake()
