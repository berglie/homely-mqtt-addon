# Homely MQTT Add-on for Home Assistant

This add-on provides MQTT functionality for Home Assistant using the [homely-mqtt](https://github.com/yusijs/homely-mqtt) project. It automatically discovers Homely devices and publishes their sensor data to MQTT for Home Assistant integration.

## Installation

1. Add this repository to your Home Assistant add-on store
2. Install the "Homely MQTT" add-on
3. Configure the add-on with your Homely credentials and MQTT broker settings
4. Start the add-on

## Configuration

### Required Options

| Option | Default | Description |
|--------|---------|-------------|
| `HOMELY_USER` | `""` | **REQUIRED**: Your Homely account email/username |
| `HOMELY_PASSWORD` | `""` | **REQUIRED**: Your Homely account password |

### MQTT Options

| Option | Default | Description |
|--------|---------|-------------|
| `MQTT_HOST` | `core-mosquitto` | MQTT broker hostname or IP address |
| `MQTT_PORT` | `1883` | MQTT broker port |
| `MQTT_USER` | `""` | MQTT broker username (leave empty if no authentication) |
| `MQTT_PASSWORD` | `""` | MQTT broker password (leave empty if no authentication) |

## Supported Sensors

The add-on automatically discovers and supports the following sensor types from your Homely devices:

### Alarm Sensors
- **Alarm State**: Text sensor showing current alarm status
- **Fire Detection**: Binary sensor for fire alarms
- **Tamper Detection**: Binary sensor for tamper alerts
- **Flood Detection**: Binary sensor for water/flood sensors

### Battery Sensors
- **Battery Level**: Binary sensor indicating low battery
- **Battery Defect**: Binary sensor for battery malfunction
- **Battery Voltage**: Numeric sensor for battery voltage levels

### Diagnostic Sensors
- **Network Address**: Text sensor showing device network address
- **Link Strength**: Numeric sensor for wireless signal strength

### Temperature Sensors
- **Temperature**: Numeric sensor for temperature readings

### Metering Sensors (HAN - Home Area Network)
- **Demand**: Numeric sensor for power demand
- **Summation Delivered**: Numeric sensor for energy delivered
- **Summation Received**: Numeric sensor for energy received

## Device Discovery

The add-on automatically:
1. Connects to the Homely API using your credentials
2. Discovers all available devices and sensors
3. Creates MQTT discovery messages for Home Assistant
4. Publishes real-time sensor updates via MQTT
5. Maintains device availability status

## Configuration Examples

### Home Assistant Add-on Options (Recommended)

Configure through the Home Assistant UI:
1. Go to **Settings** > **Add-ons** > **Homely MQTT** > **Configuration**
2. Fill in all required fields:
   - `HOMELY_USER`: Your Homely account email
   - `HOMELY_PASSWORD`: Your Homely account password
   - `MQTT_HOST`: Your MQTT broker (default: `core-mosquitto`)
   - `MQTT_PORT`: MQTT broker port (default: `1883`)
   - `MQTT_USER`: MQTT username (if required)
   - `MQTT_PASSWORD`: MQTT password (if required)
3. Click **Save** and restart the add-on

## Troubleshooting

### Common Issues

- **"HOMELY_USER is not defined"**: Make sure you have configured both `HOMELY_USER` and `HOMELY_PASSWORD` in the add-on options
- **"HOMELY_PASSWORD is not defined"**: Ensure both Homely credentials are set in the add-on configuration
- **Connection errors**: Check your MQTT broker settings and ensure it's accessible from the Home Assistant host

### Required Configuration

**You must configure these options for the add-on to work:**
- `HOMELY_USER`: Your Homely account email/username
- `HOMELY_PASSWORD`: Your Homely account password

## Limitations

- The Homely API is read-only, so the add-on cannot control devices (e.g., arm/disarm alarms)
- Some Homely devices may not be available through the API
- The add-on requires an active internet connection to communicate with Homely services

## Support

For issues with this add-on, please check the [homely-mqtt project](https://github.com/yusijs/homely-mqtt) for more information.