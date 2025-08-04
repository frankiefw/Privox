# Privōx Build Guide

This guide provides detailed instructions for building Privōx from source on different platforms.

## Ubuntu/Debian

### 1. Install Dependencies

```bash
sudo apt-get update
sudo apt-get install -y build-essential cmake libboost-all-dev libssl-dev libzmq3-dev libunbound-dev libsodium-dev libunwind8-dev liblzma-dev libreadline6-dev libldns-dev libexpat1-dev libgtest-dev doxygen graphviz libhidapi-dev libusb-1.0-0-dev libprotobuf-dev protobuf-compiler
```

### 2. Clone the Repository

```bash
git clone --recursive https://github.com/frankiefw/Privox.git
cd Privox
```

The `--recursive` flag is important as it clones all the required submodules.

### 3. Build the Project

```bash
mkdir build
cd build
cmake ..
make -j$(nproc)  # Use multiple cores for faster building
```

### 4. Generate Genesis Block

After building, you need to generate the genesis block transaction:

```bash
./bin/privoxd --print-genesis-tx
```

Copy the output (a long hexadecimal string).

### 5. Update Genesis Transaction

Edit the source file:

```bash
cd ..  # Return to the main Privox directory
nano src/cryptonote_config.h
```

Find the line with `GENESIS_COINBASE_TX_HEX` and replace the empty string with the generated transaction hex:

```cpp
const char GENESIS_COINBASE_TX_HEX[] = "YOUR_GENERATED_HEX_HERE";
```

### 6. Rebuild

```bash
cd build
make -j$(nproc)
```

## macOS

### 1. Install Dependencies

```bash
brew install cmake boost openssl zmq libsodium unbound unwind xz readline ldns expat hidapi libusb protobuf
```

### 2. Clone and Build

Follow the same steps as for Ubuntu/Debian from step 2 onwards.

## Windows

### 1. Install Dependencies

Install MSYS2 from https://www.msys2.org/

Open MSYS2 MinGW 64-bit and run:

```bash
pacman -Syu
pacman -S mingw-w64-x86_64-toolchain make mingw-w64-x86_64-cmake mingw-w64-x86_64-boost mingw-w64-x86_64-openssl mingw-w64-x86_64-zeromq mingw-w64-x86_64-libsodium mingw-w64-x86_64-hidapi mingw-w64-x86_64-protobuf mingw-w64-x86_64-libusb mingw-w64-x86_64-unbound git
```

### 2. Clone and Build

```bash
git clone --recursive https://github.com/frankiefw/Privox.git
cd Privox
mkdir build
cd build
cmake -G "MSYS Makefiles" ..
make -j$(nproc)
```

## Troubleshooting

### Missing Submodules

If you get errors about missing submodules, run:

```bash
git submodule update --init --recursive
```

### Missing Dependencies

If cmake fails with missing dependencies, make sure you've installed all required packages for your platform.

### Build Errors

If you encounter build errors, try:

1. Clean the build directory:
   ```bash
   rm -rf build
   mkdir build
   cd build
   ```

2. Use a specific compiler version if needed:
   ```bash
   cmake -DCMAKE_C_COMPILER=gcc-10 -DCMAKE_CXX_COMPILER=g++-10 ..
   ```

3. Build with verbose output to see detailed errors:
   ```bash
   make VERBOSE=1
   ```

### Running the Daemon

After successful build:

```bash
./bin/privoxd --rpc-bind-port 18236 --p2p-bind-port 17236 --confirm-external-bind
```

### Creating a Wallet

```bash
./bin/privox-wallet-cli
```

Follow the prompts to create a new wallet.