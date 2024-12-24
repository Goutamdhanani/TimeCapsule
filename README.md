# Time Capsule DApp

The **Time Capsule DApp** is a decentralized application that enables users to securely store messages or digital assets on the blockchain with a time-lock feature. Messages or assets can only be unlocked and accessed after a specified future date, ensuring both security and immutability.

---

## Features

- **Decentralized Storage:** Messages and assets are stored securely on the blockchain.
- **Time-Lock Functionality:** Users can set a specific future date for unlocking the stored items.
- **Secure & Immutable:** Ensures data integrity and protection against unauthorized access.
- **Blockchain-Powered:** Utilizes smart contracts for transparency and trust.
- **Testnet Deployment:** Fully tested on a blockchain testnet before mainnet launch.

---

## Table of Contents

1. [Installation](#installation)
2. [Usage](#usage)
3. [Technologies Used](#technologies-used)
4. [Smart Contract Overview](#smart-contract-overview)
5. [Phases](#phases)
6. [Local Development](#local-development)
7. [Testing](#testing)
8. [Deployment](#deployment)
9. [Future Enhancements](#future-enhancements)

---

## Installation

### Prerequisites

Ensure you have the following installed:

- [Node.js](https://nodejs.org/) (v16.x or later)
- [npm](https://www.npmjs.com/)
- [Hardhat](https://hardhat.org/)

### Steps

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/time-capsule-dapp.git
   cd time-capsule-dapp
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Start a local blockchain:
   ```bash
   npx hardhat node
   ```

4. Deploy the smart contract:
   ```bash
   npx hardhat run scripts/deploy.js --network localhost
   ```

---

## Usage

### Interacting with the DApp

- **Set a Time Capsule:** Specify a message or digital asset, along with a future unlock date.
- **View Capsules:** Access stored capsules (locked or unlocked).
- **Unlock Capsules:** Retrieve stored data after the unlock date has passed.

### Running Locally

1. Start the development server:
   ```bash
   npm start
   ```

2. Open the app in your browser at `http://localhost:3000`.

---

## Technologies Used

- **Solidity:** Smart contract programming language
- **Hardhat:** Development environment for Ethereum
- **Ethers.js:** Interacting with the Ethereum blockchain
- **React.js:** Frontend framework (if applicable)
- **Metamask:** Wallet for blockchain transactions

---

## Smart Contract Overview

The core smart contract is written in **Solidity** and includes:

- **Store Capsule:** Function to save a message or asset with a time-lock.
- **Unlock Capsule:** Function to retrieve stored data after the unlock date.
- **Ownership and Access Control:** Ensures only the creator can access their capsule.

Example snippet of the contract:
```solidity
function storeCapsule(string memory _message, uint256 _unlockTime) public {
    require(_unlockTime > block.timestamp, "Unlock time must be in the future.");
    capsules[msg.sender].push(Capsule(_message, _unlockTime));
}

function unlockCapsule(uint256 _index) public {
    require(block.timestamp >= capsules[msg.sender][_index].unlockTime, "Capsule is still locked.");
    // Logic to unlock capsule
}
```

---

## Phases

### Phase One: Initial Setup and Smart Contract Deployment (Current Phase)

- Set up the development environment with Node.js, Hardhat, and Ethers.js.
- Write the basic Solidity smart contract to include the time-lock functionality.
- Test the smart contract using Hardhat and deploy it on a local blockchain.
- Implement a basic script for interacting with the deployed contract.

### Phase Two: Frontend Integration

- Build a user interface using React.js.
- Connect the frontend to the deployed smart contract using Ethers.js.
- Allow users to interact with the contract (store and unlock capsules).
- Test user interactions locally.

### Phase Three: Testnet Deployment and Improvements

- Deploy the contract to a public blockchain testnet (e.g., Sepolia or Goerli).
- Test the application with testnet wallets and tokens.
- Gather feedback and fix bugs or improve UX/UI.

### Phase Four: Mainnet Launch

- Deploy the DApp to the Ethereum mainnet.
- Integrate advanced features like IPFS for off-chain storage and multi-network support.
- Ensure security audits are conducted before launch.

---

## Local Development

1. Compile the smart contract:
   ```bash
   npx hardhat compile
   ```

2. Run a local blockchain:
   ```bash
   npx hardhat node
   ```

3. Deploy the contract:
   ```bash
   npx hardhat run scripts/deploy.js --network localhost
   ```

4. Interact with the contract via Hardhat console:
   ```bash
   npx hardhat console --network localhost
   ```

---

## Testing

Run automated tests to ensure contract functionality:

```bash
npx hardhat test
```

Output example:
```
  Time Capsule Contract
    ✓ Should store a capsule
    ✓ Should not allow unlocking before the unlock date
    ✓ Should unlock the capsule after the unlock date

  3 passing (500ms)
```

---

## Deployment

### Deploy to Testnet

1. Update the `hardhat.config.js` with the testnet configuration:
   ```javascript
   networks: {
       sepolia: {
           url: "https://sepolia.infura.io/v3/YOUR_INFURA_PROJECT_ID",
           accounts: ["YOUR_PRIVATE_KEY"]
       }
   }
   ```

2. Deploy to the testnet:
   ```bash
   npx hardhat run scripts/deploy.js --network sepolia
   ```

3. Verify deployment:
   ```bash
   npx hardhat verify --network sepolia <CONTRACT_ADDRESS>
   ```

---

## Future Enhancements

- **IPFS Integration:** Store larger files securely off-chain.
- **ERC-721 Tokenization:** Tokenize capsules as NFTs for easier trading.
- **User Dashboard:** Improve UX for viewing and managing capsules.
- **Multi-Network Support:** Add compatibility with more blockchains.

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## Acknowledgements

- [Ethereum](https://ethereum.org/)
- [Hardhat](https://hardhat.org/)
- [Ethers.js](https://docs.ethers.org/)
- [OpenZeppelin](https://openzeppelin.com/)
