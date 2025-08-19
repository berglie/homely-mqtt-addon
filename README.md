# Homely MQTT Add-on for Home Assistant

This add-on provides MQTT functionality for Home Assistant using the [homely-mqtt](https://github.com/yusijs/homely-mqtt) project.

## Installation

1. Add this repository to your Home Assistant add-on store
2. Install the "Homely MQTT" add-on
3. Configure the add-on with your MQTT broker settings
4. Start the add-on

## Configuration

This addon follows the official Home Assistant addon structure and uses `bashio` utilities for configuration management.

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

### Configuration Management

The addon automatically reads configuration from Home Assistant's addon options system. No manual environment variable configuration is needed.

**Required Configuration:**
- `homely_user`: Your Homely account email/username
- `homely_password`: Your Homely account password

**Optional Configuration:**
- All other MQTT and logging options have sensible defaults

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

The addon will automatically:
- Read your configuration from Home Assistant's addon options
- Validate required fields
- Set up the environment properly
- Start the application with your settings

## Troubleshooting

### Common Issues

- **"HOMELY_USER is not defined"**: Make sure you have configured both `homely_user` and `homely_password` in the add-on options
- **"HOMELY_PASSWORD is not defined"**: Ensure both Homely credentials are set in the add-on configuration
- **Connection errors**: Check your MQTT broker settings and ensure it's accessible from the Home Assistant host
- **Configuration not loading**: The add-on automatically reads configuration from Home Assistant's addon options system

### Configuration Management

The add-on uses Home Assistant's official `bashio` utilities to:
- Automatically read configuration from addon options
- Validate required fields before starting
- Provide clear error messages for missing configuration
- Handle all configuration mapping automatically

### Required Configuration

**You must configure these options for the add-on to work:**
- `homely_user`: Your Homely account email/username
- `homely_password`: Your Homely account password

### Debug Information

The add-on will display:
- Configuration values being loaded
- Validation status for required fields
- Clear error messages for missing configuration
- Application startup progress

## Support

For issues with this add-on, please check the [homely-mqtt project](https://github.com/yusijs/homely-mqtt) for more information.