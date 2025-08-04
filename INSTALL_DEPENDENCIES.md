# Install Dependencies for Privōx

## Ubuntu/Debian

```bash
sudo apt-get update
sudo apt-get install -y build-essential cmake libboost-all-dev libssl-dev libzmq3-dev libunbound-dev libsodium-dev libunwind8-dev liblzma-dev libreadline6-dev libldns-dev libexpat1-dev libgtest-dev doxygen graphviz libhidapi-dev libusb-1.0-0-dev libprotobuf-dev protobuf-compiler
```

## macOS

```bash
brew install cmake boost openssl zmq libsodium unbound unwind xz readline ldns expat hidapi libusb protobuf
```

## Windows (MSYS2)

```bash
pacman -Syu
pacman -S mingw-w64-x86_64-toolchain make mingw-w64-x86_64-cmake mingw-w64-x86_64-boost mingw-w64-x86_64-openssl mingw-w64-x86_64-zeromq mingw-w64-x86_64-libsodium mingw-w64-x86_64-hidapi mingw-w64-x86_64-protobuf mingw-w64-x86_64-libusb mingw-w64-x86_64-unbound git
```

After installing dependencies, see BUILD_GUIDE.md for complete build instructions.
