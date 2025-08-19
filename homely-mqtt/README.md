# Homely MQTT Home Assistant Add-on

A Home Assistant add-on that provides MQTT integration for Homely devices and systems.

## Features

- MQTT broker integration for Home Assistant
- Automatic device discovery
- Configurable topic prefixes
- Support for multiple architectures (aarch64, amd64, armhf, armv7, i386)
- Easy configuration through Home Assistant UI

## Installation

### 1. Add the Repository

1. In Home Assistant, go to **Settings** > **Add-ons** > **Add-on Store**
2. Click the **⋮** menu in the top right
3. Select **Repositories**
4. Add: `https://github.com/berglie/homely-mqtt-addon`
5. Click **Add**

### 2. Build the Images

Before installing, you need to build the Docker images locally:

```bash
# Navigate to the addon directory
cd homely-mqtt

# Run the build script
./build.sh
```

This will build images for all supported architectures.

### 3. Install the Add-on

1. Go to **Settings** > **Add-ons** > **Add-on Store**
2. Search for "Homely MQTT"
3. Click on the add-on and click **Install**

## Configuration

### Required Configuration

- **homely_user**: Your Homely username
- **homely_password**: Your Homely password

### Optional Configuration

- **mqtt_broker_host**: MQTT broker hostname (default: localhost)
- **mqtt_broker_port**: MQTT broker port (default: 1883)
- **mqtt_username**: MQTT broker username (if required)
- **mqtt_password**: MQTT broker password (if required)
- **mqtt_client_id**: MQTT client ID (default: homely_mqtt)
- **mqtt_topic_prefix**: Topic prefix for MQTT messages (default: homely)
- **log_level**: Logging level (debug|info|warn|error, default: info)
- **auto_discovery**: Enable automatic device discovery (default: true)
- **discovery_prefix**: Home Assistant discovery prefix (default: homeassistant)

## Usage

1. Configure the add-on with your Homely credentials
2. Start the add-on
3. The add-on will automatically connect to your MQTT broker
4. Devices will be discovered and published to MQTT topics

## MQTT Topics

The add-on publishes to topics with the following structure:

- `{topic_prefix}/devices/{device_id}/status` - Device status updates
- `{topic_prefix}/devices/{device_id}/data` - Device data
- `{topic_prefix}/system/status` - System status
- `{topic_prefix}/system/available` - System availability

## Troubleshooting

### Common Issues

1. **404 Error during installation**: Make sure you've built the Docker images locally using `./build.sh`
2. **Connection refused**: Check your MQTT broker configuration
3. **Authentication failed**: Verify your Homely credentials

### Logs

Check the add-on logs in Home Assistant:
1. Go to the add-on configuration
2. Click on the **Logs** tab
3. Look for any error messages

## Development

### Building from Source

```bash
# Clone the repository
git clone https://github.com/berglie/homely-mqtt-addon.git
cd homely-mqtt-addon

# Build the images
cd homely-mqtt
./build.sh
```

### Architecture Support

- **aarch64**: ARM 64-bit (Raspberry Pi 4, etc.)
- **amd64**: x86_64 (Intel/AMD desktop/server)
- **armhf**: ARM 32-bit hard float
- **armv7**: ARM v7 (Raspberry Pi 2/3)
- **i386**: x86 32-bit

## License

This project is licensed under the MIT License.

## Support

For issues and questions:
- Create an issue on GitHub
- Check the Home Assistant community forums
- Review the add-on logs for error details