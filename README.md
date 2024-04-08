# Stylus workshop: Basic NFT

Simple NFT smart contract written in Rust.

## Getting started

Follow the instructions in the [Stylus quickstart](https://docs.arbitrum.io/stylus/stylus-quickstart) to configure your development environment.

## Testing the contract

The `scripts` folder contains several scripts that make individual calls to perform the most important actions:

1. [./scripts/deploy.sh](./scripts/deploy.sh) to deploy the contract
2. [./scripts/getBalance.sh](./scripts/getBalance.sh) to get the current balance of an account
3. [./scripts/mint.sh](./scripts/mint.sh) to mint an NFT
3. [./scripts/burn.sh](./scripts/burn.sh) to burn an NFT
3. [./scripts/transfer.sh](./scripts/transfer.sh) to transfer an NFT
3. [./scripts/getTokenUri.sh](./scripts/getTokenUri.sh) to get the tokenUri of an NFT

Remember to set the environment variables in an `.env` file.

## How to run a local Stylus dev node

Instructions to setup a local Stylus dev node can be found [here](https://docs.arbitrum.io/stylus/how-tos/local-stylus-dev-node).

## How to get ETH for the Stylus testnet

The Stylus testnet is an L3 chain that settles to Arbitrum Sepolia. The usual way of obtaining ETH is to bridge it from Arbitrum Sepolia through the [Arbitrum Bridge](https://bridge.arbitrum.io/?destinationChain=stylus-testnet&sourceChain=arbitrum-sepolia). You can find a list of Arbitrum Sepolia faucets [here](https://docs.arbitrum.io/stylus/reference/testnet-information#faucets).

## Useful resources

- [Stylus quickstart](https://docs.arbitrum.io/stylus/stylus-quickstart)
- [Stylus by example](https://arbitrum-stylus-by-example.vercel.app/)
- [Awesome Stylus](https://github.com/OffchainLabs/awesome-stylus)
- [Workshop presentation](https://docs.google.com/presentation/d/1YI6xvXhNmQN0ShihCi4wMNLR8c0S69jTpzIbFunhfjI/)
- [Counter program](https://github.com/OffchainLabs/stylus-workshop-counter)
- [Interactions between Rust and Solidity](https://github.com/OffchainLabs/stylus-workshop-rust-solidity/)
- [Stylus Telegram group](https://t.me/arbitrum_stylus)
- [FossAsia Telegram group](https://t.me/+wSw_SIgaJRU2Nzll)
- [Discord channel](https://discord.com/channels/585084330037084172/1146789176939909251)

## Stylus reference links

- [Stylus documentation](https://docs.arbitrum.io/stylus/stylus-gentle-introduction)
- [Stylus SDK](https://github.com/OffchainLabs/stylus-sdk-rs)
- [Cargo Stylus](https://github.com/OffchainLabs/cargo-stylus)