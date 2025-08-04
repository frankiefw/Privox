# Privōx (PVX) Cryptocurrency

Privōx is a privacy-focused cryptocurrency forked from Monero, designed to provide anonymous transactions, future private voting capabilities, and censorship-resistant decentralized applications.

## Features

- **Complete Privacy**: Utilizes ring signatures, stealth addresses, and RingCT for fully anonymous transactions
- **ASIC-Resistant Mining**: Fair distribution through CPU/GPU mining
- **Future Capabilities**: Framework for private voting and decentralized applications
- **Cross-Platform Support**: Wallets available for Windows, Linux, and macOS

## Specifications

- **Ticker**: PVX
- **Total Supply**: 500 million PVX
- **Block Time**: 2 minutes
- **Block Reward**: 120 PVX, halving every 2,102,400 blocks (~4 years)
- **Tail Emission**: 1 PVX after 490M coins emitted
- **Decimal Places**: 12
- **Premine**: 10 million PVX (2% of total supply)

## Premine Allocation

The premine is transparently allocated to the following wallets:
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

## Getting Started

### Running a Node on Ubuntu

1. Install dependencies:
   ```
   sudo apt-get update
   sudo apt-get install -y build-essential cmake libboost-all-dev libssl-dev libzmq3-dev libunbound-dev libsodium-dev libunwind8-dev liblzma-dev libreadline6-dev libldns-dev libexpat1-dev libgtest-dev doxygen graphviz libhidapi-dev libusb-1.0-0-dev libprotobuf-dev protobuf-compiler
   ```

2. Clone the repository:
   ```
   git clone --recursive https://github.com/frankiefw/Privox.git
   cd Privox
   ```

   Alternatively, use our automated build script:
   ```
   git clone --recursive https://github.com/frankiefw/Privox.git
   cd Privox
   chmod +x build_privox.sh
   ./build_privox.sh
   ```

3. Build the binaries:
   ```
   mkdir build && cd build
   cmake ..
   make
   ```

4. Run the daemon:
   ```
   ./bin/privoxd --rpc-bind-port 18236 --p2p-bind-port 17236 --confirm-external-bind
   ```

5. To mine with your CPU:
   ```
   ./bin/privoxd --start-mining your-wallet-address --mining-threads 2
   ```

### Running a Testnet Node

1. Switch to the testnet branch:
   ```
   git checkout testnet
   ```

2. Build and run:
   ```
   cd build
   cmake ..
   make
   ./bin/privoxd --testnet --rpc-bind-port 28236 --p2p-bind-port 27236
   ```

### Blockchain Explorer

To set up a local blockchain explorer:

1. Install Nginx:
   ```
   sudo apt-get install nginx
   ```

2. Clone the explorer repository (coming soon):
   ```
   git clone https://github.com/frankiefw/privox-blockchain-explorer.git
   cd privox-blockchain-explorer
   ```

3. Build and configure the explorer to connect to your local node.

## Manual Adjustments

If you want to modify settings:

- Edit `src/cryptonote_config.h` to change network parameters like ports, name, or address prefix
- Edit `src/cryptonote_basic/cryptonote_basic_impl.cpp` to adjust block rewards or premine

## Use Cases

1. **Anonymous Payments**: Send and receive funds with complete privacy
2. **Private Voting**: Future implementation for decentralized, anonymous voting
3. **Censorship-Resistant dApps**: Framework for building privacy-focused applications

## Community

- Discord: [Join our server](https://discord.gg/privox)
- Reddit: r/privox
- Twitter: @privoxcoin

## Documentation

- [Build Guide](BUILD_GUIDE.md) - Detailed instructions for building Privōx
- [Install Dependencies](INSTALL_DEPENDENCIES.md) - Required packages for different platforms
- [Changes from Monero](PRIVOX_CHANGES.md) - Summary of modifications from the original Monero codebase

## License

Privōx is released under the terms of the BSD-3-Clause license. See [LICENSE](LICENSE) for more information.

---

*"Without privacy, anonymity or expression you will never have freedom"*