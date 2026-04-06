# Day 13 — Staking Contract

A DeFi staking contract where users lock tokens and earn rewards over time.

## What It Does
- Users stake ERC20 tokens
- Rewards accumulate based on time staked
- Owner funds the reward pool
- Users unstake and receive tokens + rewards

## Contracts Deployed on Sepolia
- Token:   0x086297E896CB5B6437CB917aB9230Ac5982FbF28
- Staking: 0xd4Ab20480e12C2A5F91F6c2771283cb9582F32d8

## Concepts Used
- CEI pattern (Checks, Effects, Interactions)
- block.timestamp for time tracking
- ERC20 transferFrom with approve
- Reentrancy protection
