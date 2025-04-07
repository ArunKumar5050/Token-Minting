# Token Minting

## 📝 Project Description
**Token Minting** is a self-contained ERC20-like token smart contract written in Solidity. It allows controlled minting of tokens with a maximum supply cap and includes basic transfer, approval, and allowance mechanisms — all without relying on external libraries like OpenZeppelin.

## 🌍 Project Vision
To create a lightweight and transparent token contract for educational, testing, and production use cases where full control over every line of the smart contract is required.

## 🚀 Key Features

- 🔐 **Owner-Only Minting**: Only the contract owner can mint new tokens.
- 📈 **Maximum Supply Limit**: Prevents over-minting and ensures controlled supply.
- 💰 **ERC20 Functionality**: Includes `transfer`, `approve`, and `transferFrom` functions.
- 🧱 **No Dependencies**: 100% dependency-free, custom implementation.
- ⚙️ **Initial Supply on Deployment**: Mints a portion of tokens at deployment.

## 🔭 Future Scope

- 🌐 **Web3 Frontend Interface**: Allow users to interact with the token through a dApp.
- 🔒 **Multi-signature Minting**: Add enhanced security for minting control.
- 🔄 **DAO Governance**: Community voting for minting new tokens.
- 📊 **Blockchain Explorer Integration**: Better traceability of token events.
- 🔁 **Burn Functionality**: Add the ability to burn tokens from the total supply.

---

🛠️ Built with:
- Solidity (v0.8.x)
- Remix IDE / Hardhat (for testing & deployment)

🧪 To Deploy:
1. Open [Remix](https://remix.ethereum.org/)
2. Create a file `TokenMint.sol`
3. Paste the smart contract code
4. Compile with Solidity 0.8.x
5. Deploy with constructor params: `_initialSupply`, `_maxSupply`

