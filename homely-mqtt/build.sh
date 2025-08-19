#!/bin/bash

# Build script for Homely MQTT Home Assistant Add-on
# This script builds Docker images for all supported architectures

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}Building Homely MQTT Add-on for all architectures...${NC}"

# Build for each architecture
architectures=("aarch64" "amd64" "armhf" "armv7" "i386")

for arch in "${architectures[@]}"; do
    echo -e "${YELLOW}Building for ${arch}...${NC}"
    
    # Build the image
    docker build \
        --build-arg BUILD_FROM=ghcr.io/home-assistant/${arch}-base:3.19 \
        --tag local/${arch}-addon-homely-mqtt:2.0.0 \
        --file Dockerfile \
        .
    
    echo -e "${GREEN}✓ Built ${arch} image${NC}"
done

echo -e "${GREEN}All images built successfully!${NC}"
echo -e "${YELLOW}You can now install the add-on from your local repository.${NC}"