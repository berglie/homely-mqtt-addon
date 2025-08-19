# Homely MQTT Home Assistant Add-on Repository

This repository contains a Home Assistant add-on for integrating Homely devices with MQTT.

## What's Fixed

- **404 Error Resolved**: Changed image reference from non-existent `homeassistant/{arch}-addon-homely-mqtt` to `local/{arch}-addon-homely-mqtt`
- **New Homely Logo**: Replaced Samba logo with custom Homely house icon
- **Local Build Support**: Added build script to create Docker images locally
- **Complete Source Code**: Added full TypeScript application structure

## Quick Installation

1. **Add this repository** to Home Assistant:
   - Go to Settings > Add-ons > Add-on Store
   - Click ⋮ > Repositories
   - Add: `https://github.com/berglie/homely-mqtt-addon`

2. **Build the images locally** (required before installation):
   ```bash
   cd homely-mqtt
   ./build.sh
   ```

3. **Install the add-on** from the Add-on Store

## Architecture Support

- aarch64 (ARM 64-bit)
- amd64 (x86_64)
- armhf (ARM 32-bit)
- armv7 (ARM v7)
- i386 (x86 32-bit)

## Configuration

The add-on requires your Homely credentials and MQTT broker settings. See the [addon README](homely-mqtt/README.md) for detailed configuration options.

## Troubleshooting

If you encounter the "404 Client Error" again:
1. Make sure you've run `./build.sh` in the `homely-mqtt` directory
2. Verify Docker is running and accessible
3. Check that all architecture images were built successfully

## Development

This add-on is built with:
- TypeScript/Node.js for the application
- MQTT for communication
- Winston for logging
- Docker for containerization

See the [addon source code](homely-mqtt/source/) for implementation details.