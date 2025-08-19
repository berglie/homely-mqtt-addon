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
| `homely_user` | `""` | **REQUIRED**: Your Homely account email/username |
| `homely_password` | `""` | **REQUIRED**: Your Homely account password |

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
- `HOMELY_USER`: **REQUIRED**: Your Homely account email/username
- `HOMELY_PASSWORD`: **REQUIRED**: Your Homely account password

## Usage

After starting the add-on, it will:

1. Connect to your MQTT broker
2. Publish device information using MQTT discovery
3. Handle MQTT messages for device control
4. Provide real-time status updates

## Configuration Examples

### Home Assistant Add-on Options (Recommended)

Configure through the Home Assistant UI:
1. Go to **Settings** > **Add-ons** > **Homely MQTT** > **Configuration**
2. Fill in all required fields, especially `homely_user` and `homely_password`
3. Click **Save** and restart the add-on

### Manual Configuration File

Create `/config/homely-mqtt.yaml` in your Home Assistant config directory:

```yaml
mqtt_broker_host: "192.168.1.100"
mqtt_broker_port: 1883
mqtt_username: "mqtt_user"
mqtt_password: "mqtt_password"
mqtt_client_id: "homely_mqtt"
mqtt_topic_prefix: "homely"
log_level: "info"
auto_discovery: true
discovery_prefix: "homeassistant"
homely_user: "your_email@example.com"
homely_password: "your_password"
```

## Troubleshooting

### Common Issues

- **"HOMELY_USER is not defined"**: Make sure you have configured both `homely_user` and `homely_password` in the add-on options
- **"HOMELY_PASSWORD is not defined"**: Ensure both Homely credentials are set in the add-on configuration
- **Connection errors**: Check your MQTT broker settings and ensure it's accessible from the Home Assistant host
- **Configuration not loading**: The add-on reads configuration from `/data/options.json` (Home Assistant managed) or `/config/homely-mqtt.yaml` (manual)

### Configuration Priority

The add-on reads configuration in this order:
1. `/data/options.json` (Home Assistant add-on options)
2. `/config/homely-mqtt.yaml` (manual configuration file)
3. Environment variables (fallback)

### Required Configuration

**You must configure these options for the add-on to work:**
- `homely_user`: Your Homely account email/username
- `homely_password`: Your Homely account password

### Debug Information

The add-on will display:
- Available environment variables
- Configuration file contents (if found)
- Current configuration values
- Detailed error messages for missing required values

## Support

For issues with this add-on, please check the [homely-mqtt project](https://github.com/yusijs/homely-mqtt) for more information.