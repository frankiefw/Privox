#!/bin/bash

# Privōx Build Script
# This script automates the build process for Privōx

set -e  # Exit on error

# Function to display colored text
print_status() {
    echo -e "\e[1;34m>> $1\e[0m"
}

print_error() {
    echo -e "\e[1;31m>> ERROR: $1\e[0m"
}

print_success() {
    echo -e "\e[1;32m>> $1\e[0m"
}

# Check if running as root
if [ "$EUID" -eq 0 ]; then
    print_error "Please do not run this script as root or with sudo"
    exit 1
fi

# Detect OS
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$NAME
elif [ -f /etc/debian_version ]; then
    OS="Debian"
elif [ -f /etc/redhat-release ]; then
    OS="RedHat"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    OS="macOS"
else
    OS="Unknown"
fi

print_status "Detected OS: $OS"

# Install dependencies
install_dependencies() {
    print_status "Installing dependencies..."
    
    case $OS in
        *Ubuntu*|*Debian*)
            sudo apt-get update
            sudo apt-get install -y build-essential cmake libboost-all-dev libssl-dev libzmq3-dev libunbound-dev libsodium-dev libunwind8-dev liblzma-dev libreadline6-dev libldns-dev libexpat1-dev libgtest-dev doxygen graphviz libhidapi-dev libusb-1.0-0-dev libprotobuf-dev protobuf-compiler
            ;;
        *macOS*)
            brew install cmake boost openssl zmq libsodium unbound unwind xz readline ldns expat hidapi libusb protobuf
            ;;
        *)
            print_error "Unsupported OS for automatic dependency installation"
            print_status "Please install dependencies manually according to INSTALL_DEPENDENCIES.md"
            exit 1
            ;;
    esac
    
    print_success "Dependencies installed successfully"
}

# Update submodules
update_submodules() {
    print_status "Updating git submodules..."
    git submodule update --init --recursive
    print_success "Submodules updated successfully"
}

# Build Privōx
build_privox() {
    print_status "Building Privōx..."
    
    # Create build directory if it doesn't exist
    mkdir -p build
    cd build
    
    # Configure with CMake
    print_status "Running CMake..."
    cmake ..
    
    # Build with make
    print_status "Running make..."
    CORES=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || sysctl -n hw.ncpu 2>/dev/null || echo 2)
    make -j$CORES
    
    print_success "Privōx built successfully!"
}

# Generate genesis block
generate_genesis() {
    print_status "Generating genesis block transaction..."
    
    if [ -f bin/privoxd ]; then
        GENESIS_TX=$(./bin/privoxd --print-genesis-tx | grep -oP '(?<=Genesis block transaction: ).*')
        
        if [ -n "$GENESIS_TX" ]; then
            print_success "Genesis transaction generated: $GENESIS_TX"
            print_status "Please update src/cryptonote_config.h with this value for GENESIS_COINBASE_TX_HEX"
        else
            print_error "Failed to generate genesis transaction"
        fi
    else
        print_error "privoxd binary not found. Build failed?"
    fi
}

# Main execution
print_status "Starting Privōx build process..."

# Ask for confirmation before installing dependencies
read -p "Do you want to install dependencies? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    install_dependencies
fi

update_submodules
build_privox
generate_genesis

print_success "Build process completed!"
print_status "To run the Privōx daemon: ./bin/privoxd"
print_status "To create a wallet: ./bin/privox-wallet-cli"