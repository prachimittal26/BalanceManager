# BalanceManager
# BalanceManager Smart Contract

This project contains a smart contract called `BalanceManager` written in Solidity. The `BalanceManager` contract allows users to deposit and withdraw funds, and provides additional functionality for transferring contract ownership and handling emergency withdrawals.

## Overview

The contract includes the following main features:
- **Deposit Funds**: Users can deposit Ether into the contract.
- **Withdraw Funds**: Users can withdraw their deposited Ether.
- **Transfer Ownership**: The contract owner can transfer ownership to another address.
- **Get Balance**: Anyone can check the balance of any account.
- **Emergency Withdraw**: The contract owner can withdraw all funds from the contract in case of an emergency.

## Functions

- `deposit()`: Allows users to deposit Ether into the contract.
- `withdraw(uint256 amount)`: Allows users to withdraw a specified amount of Ether from their balance.
- `transferOwnership(address newOwner)`: Allows the current owner to transfer ownership of the contract to a new address.
- `getBalance(address account)`: Returns the balance of the specified account.
- `checkBalance(address account)`: Asserts that the balance of the specified account is non-negative (used for internal consistency checks).
- `emergencyWithdraw()`: Allows the owner to withdraw all funds from the contract in an emergency.

## Usage

### Prerequisites

Ensure you have the following installed:
- Node.js
- Truffle
- Ganache (for local development)

### Steps

1. Clone the repository:
   ```sh
   git clone https://github.com/your-username/BalanceManager.git
   cd BalanceManager
