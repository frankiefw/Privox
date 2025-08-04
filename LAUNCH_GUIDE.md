# Privōx Launch Guide

This guide provides step-by-step instructions for launching Privōx mainnet and testnet nodes, as well as troubleshooting tips.

## Mainnet Launch Checklist

1. [ ] Install dependencies
2. [ ] Build Privōx from source
3. [ ] Generate a wallet
4. [ ] Start the daemon
5. [ ] Mine initial blocks
6. [ ] Set up blockchain explorer (optional)
7. [ ] Connect to other nodes

## Step 1: Install Dependencies

```bash
sudo apt-get update
sudo apt-get install -y build-essential cmake libboost-all-dev libssl-dev libzmq3-dev libunbound-dev libsodium-dev libunwind8-dev liblzma-dev libreadline6-dev libldns-dev libexpat1-dev libgtest-dev doxygen graphviz libhidapi-dev libusb-1.0-0-dev libprotobuf-dev protobuf-compiler
```

## Step 2: Build Privōx

```bash
git clone --recursive https://github.com/frankiefw/Privox.git
cd Privox
mkdir build && cd build
cmake ..
make
```

Alternatively, use our automated build script:
```bash
git clone --recursive https://github.com/frankiefw/Privox.git
cd Privox
chmod +x build_privox.sh
./build_privox.sh
```

## Step 3: Generate a Wallet

```bash
./bin/privox-wallet-cli
```

Follow the prompts to create a new wallet. Write down your seed phrase and keep it safe!

## Step 4: Start the Daemon

```bash
./bin/privoxd --rpc-bind-port 18236 --p2p-bind-port 17236 --confirm-external-bind
```

## Step 5: Mine Initial Blocks

```bash
./bin/privoxd --start-mining YOUR_WALLET_ADDRESS --mining-threads 2
```

Replace `YOUR_WALLET_ADDRESS` with your actual Privōx wallet address.

## Step 6: Set Up Blockchain Explorer (Optional)

```bash
sudo apt-get install nginx
git clone https://github.com/frankiefw/privox-blockchain-explorer.git
cd privox-blockchain-explorer
# Follow the explorer's build instructions
```

Note: The blockchain explorer repository will be available soon.

## Step 7: Connect to Other Nodes

Add known nodes to your configuration:

```bash
./bin/privoxd --add-peer node1.privox.network:17236 --add-peer node2.privox.network:17236
```

## Testnet Launch

To run a testnet node:

```bash
git checkout testnet
cd build
cmake ..
make
./bin/privoxd --testnet --rpc-bind-port 28236 --p2p-bind-port 27236
```

To mine on testnet:

```bash
./bin/privoxd --testnet --start-mining YOUR_TESTNET_WALLET_ADDRESS --mining-threads 2
```

## Troubleshooting

### Daemon Won't Start

- Check if ports 17236/18236 are open:
  ```bash
  sudo netstat -tulpn | grep -E '17236|18236'
  ```

- Check for conflicting processes:
  ```bash
  ps aux | grep privoxd
  ```

### Mining Not Working

- Verify your wallet address is correct
- Check CPU compatibility:
  ```bash
  ./bin/privoxd --start-mining YOUR_WALLET_ADDRESS --mining-threads 1
  ```

### Connection Issues

- Check firewall settings:
  ```bash
  sudo ufw status
  ```

- Allow required ports:
  ```bash
  sudo ufw allow 17236/tcp
  sudo ufw allow 18236/tcp
  ```

## Accessing the Blockchain

### Command Line Wallet

```bash
./bin/privox-wallet-cli
```

### RPC Wallet

```bash
./bin/privox-wallet-rpc --rpc-bind-port 18237 --wallet-file /path/to/wallet --password YOUR_PASSWORD
```

## Updating Privōx

To update to the latest version:

```bash
cd privox
git pull
cd build
make clean
cmake ..
make
```

---

For additional help, join our Discord server or visit the Privōx community forums.