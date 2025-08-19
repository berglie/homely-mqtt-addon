# Homely MQTT Add-on Documentation

## Overview

The Homely MQTT add-on provides MQTT functionality for Home Assistant using the [homely-mqtt](https://github.com/yusijs/homely-mqtt) project. This add-on follows the official Home Assistant addon structure and provides seamless integration with your Home Assistant instance.

## Features

- **MQTT Integration**: Connects to your MQTT broker for device communication
- **Auto Discovery**: Automatically discovers and configures devices via MQTT
- **Real-time Updates**: Provides live status updates for your Homely devices
- **Home Assistant Native**: Built using official Home Assistant addon patterns
- **Easy Configuration**: Simple configuration through the Home Assistant UI

## Installation

1. **Add Repository**: In Home Assistant, go to **Settings** > **Add-ons** > **Add-on Store** > **⋮** > **Repositories**
2. **Add Repository URL**: `https://github.com/berglie/homely-mqtt-addon`
3. **Install Add-on**: Search for "Homely MQTT" and click **Install**
4. **Configure**: Set your MQTT broker details and Homely credentials
5. **Start**: Click **Start** to begin

## Configuration

### Required Configuration

| Option | Description |
|--------|-------------|
| `homely_user` | Your Homely account email/username |
| `homely_password` | Your Homely account password |

### Optional Configuration

| Option | Default | Description |
|--------|---------|-------------|
| `mqtt_broker_host` | `localhost` | MQTT broker hostname or IP |
| `mqtt_broker_port` | `1883` | MQTT broker port |
| `mqtt_username` | `""` | MQTT broker username |
| `mqtt_password` | `""` | MQTT broker password |
| `mqtt_client_id` | `homely_mqtt` | MQTT client identifier |
| `mqtt_topic_prefix` | `homely` | Topic prefix for all messages |
| `log_level` | `info` | Logging level (debug, info, warn, error) |
| `auto_discovery` | `true` | Enable MQTT device discovery |
| `discovery_prefix` | `homeassistant` | MQTT discovery prefix |

## Usage

### Starting the Add-on

1. **Configure**: Set all required options in the add-on configuration
2. **Save**: Click **Save** to store your configuration
3. **Start**: Click **Start** to launch the add-on
4. **Monitor**: Check the logs for connection status and any errors

### MQTT Topics

The add-on will publish to the following MQTT topics:

- `homely/notice` - System status and notifications
- `homely/+/status` - Device status updates
- `homely/devices/count` - Total device count
- `homely/system/status` - System health status
- `homely/system/available` - System availability

### Device Discovery

When `auto_discovery` is enabled, the add-on will automatically:

1. Discover your Homely devices
2. Create MQTT entities in Home Assistant
3. Handle device state changes
4. Provide real-time status updates

## Troubleshooting

### Common Issues

#### Configuration Errors

- **"homely_user is required"**: Set your Homely username in the add-on options
- **"homely_password is required"**: Set your Homely password in the add-on options
- **MQTT connection failed**: Verify your MQTT broker settings and network connectivity

#### Runtime Issues

- **Add-on won't start**: Check the logs for configuration validation errors
- **Devices not appearing**: Ensure MQTT integration is enabled in Home Assistant
- **Connection drops**: Check network stability and MQTT broker health

### Log Analysis

The add-on provides detailed logging:

- **INFO**: Normal operation and status updates
- **WARNING**: Non-critical issues that don't prevent operation
- **ERROR**: Critical issues that may prevent proper operation
- **DEBUG**: Detailed debugging information (when log_level is set to debug)

### Getting Help

1. **Check Logs**: Review the add-on logs for error messages
2. **Verify Configuration**: Ensure all required fields are set
3. **Test MQTT**: Verify your MQTT broker is accessible
4. **Community Support**: Visit the [homely-mqtt project](https://github.com/yusijs/homely-mqtt) for more help

## Technical Details

### Architecture

This add-on follows the official Home Assistant addon architecture:

- **Base Image**: Uses `ghcr.io/home-assistant/{arch}-base:3.19`
- **Initialization**: `/etc/cont-init.d/homely-mqtt.sh` handles configuration
- **Service Management**: `/etc/services.d/homely-mqtt/run` starts the application
- **Configuration**: Uses `bashio` utilities for Home Assistant integration

### Dependencies

- **Node.js**: Runtime environment for the homely-mqtt application
- **npm**: Package management for dependencies
- **bashio**: Home Assistant addon utilities
- **jq**: JSON processing for configuration

### Ports

- **1883/tcp**: MQTT broker communication port

### Volumes

- **/data**: Persistent storage for application data
- **/config**: Read-only access to Home Assistant configuration

## Development

### Building

To build this add-on locally:

```bash
# Clone the repository
git clone https://github.com/berglie/homely-mqtt-addon.git
cd homely-mqtt-addon

# Build for your architecture
docker build -t homely-mqtt .
```

### Testing

Test the add-on configuration:

1. **Local Build**: Build the Docker image locally
2. **Configuration Test**: Verify configuration parsing works
3. **Integration Test**: Test with a local MQTT broker

### Contributing

Contributions are welcome! Please:

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

This add-on is licensed under the same terms as the homely-mqtt project. See the [homely-mqtt repository](https://github.com/yusijs/homely-mqtt) for license details.