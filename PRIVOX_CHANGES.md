# Privōx Cryptocurrency - Changes from Monero

This document outlines all the changes made to the Monero codebase to create Privōx (PVX).

## Core Changes

### Cryptocurrency Parameters

1. **Name and Ticker**
   - Changed name from "Monero" to "Privōx"
   - Changed ticker from "XMR" to "PVX"
   - Modified in `src/cryptonote_config.h`

2. **Supply and Emission**
   - Changed total supply from unlimited to 500 million PVX
   - Set premine of 10 million PVX in genesis block
   - Modified block reward to 120 PVX, halving every 2,102,400 blocks (~4 years)
   - Added tail emission of 1 PVX after 490M coins emitted
   - Modified in `src/cryptonote_config.h` and `src/cryptonote_basic/cryptonote_basic_impl.cpp`

3. **Network Parameters**
   - Changed address prefix to start with "P" (mainnet) and "T" (testnet)
   - Modified P2P port to 17236 (mainnet) and 27236 (testnet)
   - Modified RPC port to 18236 (mainnet) and 28236 (testnet)
   - Created unique network IDs for both mainnet and testnet
   - Modified in `src/cryptonote_config.h`

4. **Genesis Block**
   - Added genesis block statement: "Without privacy, anonymity or expression you will never have freedom"
   - Prepared for premine of 10M PVX
   - Modified in `src/cryptonote_config.h`

## Build System

1. **GitHub Actions**
   - Modified `.github/workflows/build.yml` to build Privōx binaries for Windows, Linux, and macOS

## Documentation

1. **README.md**
   - Created new README.md with Privōx-specific information
   - Included specifications, premine allocation, and setup instructions

2. **LAUNCH_GUIDE.md**
   - Created detailed guide for launching mainnet and testnet nodes
   - Added troubleshooting tips

3. **BUILD_GUIDE.md**
   - Detailed build instructions for all platforms
   - Troubleshooting tips for common build issues

4. **INSTALL_DEPENDENCIES.md**
   - Instructions for installing dependencies on different platforms
   - Package lists for Ubuntu/Debian, macOS, and Windows

5. **build_privox.sh**
   - Automated build script to simplify the build process
   - Handles dependency installation, submodule updates, and compilation

6. **PRIVOX_CHANGES.md**
   - This document, summarizing all changes made

## Premine Allocation

The 10 million PVX premine is allocated to the following purposes:
- Development Fund: 4M PVX
- Marketing: 1M PVX
- Raid Payouts: 200k PVX
- Competitions: 300k PVX
- Billboards: 500k PVX
- Airdrop: 1.5M PVX
- Bug Bounty: 1M PVX
- Owner's Fund: 500k PVX
- Exchange Liquidity: 1M PVX
- OTC Sales: 500k PVX
- Emergency Fund: 500k PVX

## Manual Adjustment Points

If you need to make further adjustments to Privōx, here are the key files to modify:

1. **Network Parameters**
   - `src/cryptonote_config.h`: Contains network ports, address prefixes, and network IDs

2. **Block Reward and Emission**
   - `src/cryptonote_basic/cryptonote_basic_impl.cpp`: Contains the block reward calculation function

3. **Genesis Block**
   - After building, you'll need to generate the genesis block and update the `GENESIS_TX` value in `src/cryptonote_config.h`

## Next Steps

1. **Generate Genesis Block**
   - Build the project
   - Run `./bin/privoxd --print-genesis-tx`
   - Update the `GENESIS_COINBASE_TX_HEX` value in `src/cryptonote_config.h`

2. **Create GUI Wallet**
   - Fork the Monero GUI wallet repository (https://github.com/monero-project/monero-gui)
   - Apply similar changes to network parameters
   - Update branding to Privōx

3. **Create Blockchain Explorer**
   - Fork an open-source Monero explorer (https://github.com/monero-project/monero-blockchain-explorer)
   - Configure it to connect to Privōx nodes
   - Label premine wallets for transparency

4. **Set Up Seed Nodes**
   - Configure multiple seed nodes for network stability
   - Update `src/p2p/net_node.inl` with seed node information

5. **Community Building**
   - Set up Discord server for airdrop distribution
   - Create announcements for Reddit and Bitcointalk
   - Prepare documentation for exchange listings