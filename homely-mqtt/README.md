# Homely MQTT Add-on for Home Assistant

**Version: 1.1.1** - Fixed Auto-Discovery Issues! 🚀

A Home Assistant add-on that bridges Homely security systems with MQTT, enabling seamless integration with Home Assistant and other smart home platforms.

## ✨ New in Version 1.1.1

### 🎯 **Enhanced Auto-Discovery**
- **Zero Configuration Required**: Devices automatically appear in Home Assistant
- **Device Grouping**: All sensors from the same device are grouped together
- **Professional Appearance**: Includes manufacturer, model, and version information
- **Availability Tracking**: Monitor device online/offline status in real-time

### 🔧 **Advanced Configuration Options**
- `enhanced_auto_discovery`: Enable modern MQTT Device Discovery
- `include_device_info`: Include detailed device information
- `include_availability`: Track device availability status
- `retain_discovery`: Control discovery message retention
- `discovery_delay`: Customize timing between discovery messages

## Features

- **Real-time Integration**: Connects to Homely via WebSocket for instant updates
- **MQTT Bridge**: Publishes all sensor data and alarm states to MQTT
- **Home Assistant Native**: Automatically creates entities with proper device classes
- **Flexible Configuration**: Customizable MQTT topics and discovery settings
- **Comprehensive Logging**: Detailed logging for troubleshooting and monitoring

## Quick Start

1. **Install the Add-on** from the Home Assistant add-on store
2. **Configure MQTT** broker connection details
3. **Enter Homely credentials** (username/password)
4. **Start the add-on** - devices will appear automatically!
5. **Enjoy automatic device discovery** with professional grouping

## Configuration

### Required Settings

| Option | Description | Default |
|--------|-------------|---------|
| `mqtt_broker_host` | MQTT broker hostname/IP | `localhost` |
| `mqtt_broker_port` | MQTT broker port | `1883` |
| `homely_user` | Your Homely username | - |
| `homely_password` | Your Homely password | - |

### Enhanced Auto-Discovery Settings

| Option | Description | Default |
|--------|-------------|---------|
| `enhanced_auto_discovery` | Enable enhanced discovery | `true` |
| `include_device_info` | Include device details | `true` |
| `include_availability` | Track device status | `true` |
| `retain_discovery` | Retain discovery messages | `true` |
| `discovery_delay` | Delay between messages (ms) | `500` |

## Supported Devices

- **Security Sensors**: Motion, contact, smoke, CO, water leak
- **Environmental**: Temperature, humidity, air quality
- **Alarm System**: Armed/disarmed states, alarm triggers
- **Gateway**: System status and connectivity

## MQTT Topics

### Discovery Topics
```
homeassistant/sensor/homely_{device_id}_{sensor_name}/config
```

### State Topics
```
homely/{device_id}/{sensor_name}/state
```

### Availability Topics
```
homely/{device_id}/online
```

## Device Grouping

All entities are automatically grouped by device in Home Assistant:

```
Homely Device ABC123
├── Temperature Sensor
├── Motion Sensor
├── Contact Sensor
└── Battery Level
```

## Troubleshooting

### Devices Not Appearing
1. Check that `enhanced_auto_discovery` is enabled
2. Verify MQTT connection is working
3. Check addon logs for discovery messages
4. Ensure MQTT integration is enabled in Home Assistant

### Common Issues
- **MQTT Connection Failed**: Verify broker host/port and credentials
- **No Devices Found**: Check Homely username/password
- **Discovery Not Working**: Verify `discovery_prefix` is set to `homeassistant`

## Advanced Usage

### Custom MQTT Topics
You can customize topic prefixes and structure through the configuration options.

### Discovery Customization
The enhanced discovery system can be customized for specific use cases by modifying the source code.

### Integration with Other Platforms
Since this addon publishes to MQTT, you can integrate with any MQTT-compatible platform:
- Node-RED
- OpenHAB
- Domoticz
- Custom applications

## Development

This addon is built on top of the [homely-mqtt](https://github.com/yusijs/homely-mqtt) library and extends it with enhanced auto-discovery capabilities.

### Building from Source
```bash
git clone https://github.com/berglie/homely-mqtt-addon
cd homely-mqtt-addon
docker build -t homely-mqtt-addon .
```

## Support

- **Issues**: Report bugs and feature requests on GitHub
- **Documentation**: See [AUTO_DISCOVERY_README.md](AUTO_DISCOVERY_README.md) for detailed auto-discovery documentation
- **Community**: Join Home Assistant community discussions

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Changelog

### Version 1.1.1
- 🐛 Fixed MQTT auto-discovery not working due to configuration conflicts
- 🔧 Updated configuration to prioritize environment variables
- 📦 Fixed missing source code due to uninitialized git submodule
- 🚀 Forced MQTT enabled when running as Home Assistant addon
- 📊 Improved environment variable handling for MQTT settings

### Version 1.1.0
- ✨ Added enhanced MQTT Device Discovery
- 🔧 New configuration options for auto-discovery
- 📱 Automatic device grouping in Home Assistant
- 🚀 Zero-configuration device setup
- 📊 Device availability tracking
- 🔄 Backward compatibility with legacy discovery

### Version 1.0.19
- Initial release with basic MQTT integration
- WebSocket-based real-time updates
- Basic sensor and alarm state publishing