# Homely MQTT Add-on for Home Assistant

This add-on provides MQTT functionality for Home Assistant using the [homely-mqtt](https://github.com/yusijs/homely-mqtt) project.

## Installation

1. Add this repository to your Home Assistant add-on store
2. Install the "Homely MQTT" add-on
3. Configure the add-on with your MQTT broker settings
4. Start the add-on

## Configuration

### Options

| Option | Default | Description |
|--------|---------|-------------|
| `mqtt_broker_host` | `localhost` | MQTT broker hostname or IP address |
| `mqtt_broker_port` | `1883` | MQTT broker port |
| `mqtt_username` | `""` | MQTT broker username (leave empty if no authentication) |
| `mqtt_password` | `""` | MQTT broker password (leave empty if no authentication) |
| `mqtt_client_id` | `homely_mqtt` | MQTT client ID |
| `mqtt_topic_prefix` | `homely` | MQTT topic prefix for all messages |
| `log_level` | `info` | Log level (debug, info, warn, error) |
| `auto_discovery` | `true` | Enable Home Assistant MQTT discovery |
| `discovery_prefix` | `homeassistant` | MQTT discovery prefix |

### Environment Variables

The following environment variables can be set:

- `MQTT_BROKER_HOST`: MQTT broker hostname
- `MQTT_BROKER_PORT`: MQTT broker port
- `MQTT_USERNAME`: MQTT broker username
- `MQTT_PASSWORD`: MQTT broker password
- `MQTT_CLIENT_ID`: MQTT client ID
- `MQTT_TOPIC_PREFIX`: MQTT topic prefix
- `LOG_LEVEL`: Log level
- `AUTO_DISCOVERY`: Enable/disable auto discovery
- `DISCOVERY_PREFIX`: MQTT discovery prefix

## Usage

After starting the add-on, it will:

1. Connect to your MQTT broker
2. Publish device information using MQTT discovery
3. Handle MQTT messages for device control
4. Provide real-time status updates

## Troubleshooting

- Check the add-on logs for connection errors
- Verify your MQTT broker settings
- Ensure your MQTT broker is accessible from the Home Assistant host
- Check that the required ports are open

## Support

For issues with this add-on, please check the [homely-mqtt project](https://github.com/yusijs/homely-mqtt) for more information.