# SimpleToken Project

## 📌 Overview
This project demonstrates the development of a basic smart contract using Solidity for a token transfer system.  
The contract allows token creation, balance tracking, and secure transfers between Ethereum addresses.

---

## ⚙️ Features
- Token name: **SimpleToken**
- Symbol: **STK**
- Decimals: **18**
- Total Supply: Defined at deployment
- Functions:
  - `balanceOf(address)` → Check token balance
  - `transfer(address, amount)` → Transfer tokens securely
- Event logging for transfers

---

## 🛠️ Setup & Deployment
1. Open [Remix IDE](https://remix.ethereum.org).
2. Create a new file: `SimpleToken.sol`.
3. Paste the contract code.
4. Compile with Solidity `0.8.20`.
5. Deploy using:
   - **Injected Provider – MetaMask**
   - Connect to **Sepolia** or **Goerli** testnet
   - Provide `initialSupply` (e.g., `1000`)
6. Verify deployment on [Etherscan Testnet](https://sepolia.etherscan.io/).

---

## 🔍 Validation
| Function | Input | Expected Output |
|----------|-------|-----------------|
| `name()` | – | `SimpleToken` |
| `symbol()` | – | `STK` |
| `
