# RSK Runes: EVM Representation of Bitcoin Runes

This project provides an Ethereum Virtual Machine (EVM) representation of Bitcoin Runes using ERC1155 tokens on the Rootstock (RSK) network. Each Rune on the Bitcoin network is mirrored 1:1 as a non-fungible token (NFT) on RSK, leveraging the ERC1155 standard to support efficient batch transfers and management.

## Project Overview

This repository contains the smart contract implementation for creating and managing Runes on the RSK network. The project uses the latest version of Solidity, and all development tasks are facilitated using Foundry, a fast, portable, and modular toolkit for Ethereum application development.

## Prerequisites

Ensure you have the following installed on your machine before proceeding:
- [Foundry](https://book.getfoundry.sh/getting-started/installation): A toolkit for Ethereum development.
- [Anvil](https://book.getfoundry.sh/anvil/): A local Ethereum node for testing.
- [Forge](https://book.getfoundry.sh/forge/): A command-line tool for building, testing, and deploying smart contracts.
- [Cast](https://book.getfoundry.sh/cast/): A tool for interacting with Ethereum smart contracts from the command line.

## Quick Start

### 1. Build the Project

Compile the Solidity contracts using Foundry:

```shell
forge build
```

### 2. Run Tests

Execute the tests to ensure the smart contracts work as expected:

```shell
forge test
```

### 3. Format the Code

Automatically format your Solidity code to maintain consistency:

```shell
forge fmt
```

### 4. Gas Snapshots

Take gas usage snapshots to monitor and optimize the gas consumption of your contracts:

```shell
forge snapshot
```

### 5. Run a Local Node

Start a local Ethereum node for testing purposes using Anvil:

```shell
anvil
```

### 6. Deploy the Contracts

Deploy your contracts to the RSK network using the `forge script` command. Replace `<your_rpc_url>` and `<your_private_key>` with your specific RSK RPC URL and private key:

```shell
forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### 7. Interact with Contracts

Use Cast to interact with deployed contracts directly from the command line:

```shell
cast <subcommand>
```

### 8. Get Help

Access help documentation for any Foundry tool:

```shell
forge --help
anvil --help
cast --help
```

## Deploying and Verifying the Contract

### Deploy with Custom Gas Limit and Price

When deploying your contract on the RSK network, it's important to specify the appropriate gas limit and price to avoid errors such as `Transaction dropped from the mempool`. Here's an example of deploying and verifying a contract with increased gas settings:

```bash
forge script script/DeployToRSK.s.sol --broadcast --legacy \
  --verify \
  --verifier blockscout \
  --verifier-url https://rootstock-testnet.blockscout.com/api/ \
  --chain-id 31 --gas-limit 3500000 --gas-price 5000000000 -vvvv
```

### Manual Contract Verification

If the contract was not verified during the initial deployment, you can manually verify it using the `forge verify-contract` command:

```bash
forge verify-contract \
  --rpc-url https://rpc.testnet.rootstock.io/IZszDIaYFFiHcjVPDtTtNRaHLjAU5r-T \
  0xaE6AE4297fd5a1db80b76119e35DfCdfC6bbf89B \
  src/RuneToken.sol:RuneToken \
  --verifier blockscout \
  --verifier-url https://rootstock-testnet.blockscout.com/api/
```

### Flattening Contracts for Verification

To manually verify the contract on the RSK network, you may need to flatten the contract into a single file:

```bash
forge flatten src/RuneToken.sol > flat/RuneToken_flat.sol
```

This flattened file can then be used for manual verification via block explorers or other verification tools.

## Conclusion

For additional support or inquiries, please refer to the official [Foundry documentation](https://book.getfoundry.sh/) or contact the project maintainers.
