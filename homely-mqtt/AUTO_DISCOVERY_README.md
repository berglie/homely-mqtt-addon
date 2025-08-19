# Enhanced Auto-Discovery for Homely MQTT Addon

This addon now includes enhanced MQTT Device Discovery that automatically creates and manages entities in Home Assistant without manual configuration.

## Features

### 🚀 **Automatic Device Discovery**
- **Zero Configuration Required**: Devices are automatically discovered and added to Home Assistant
- **Real-time Updates**: New devices are detected and added automatically
- **Device Grouping**: All sensors from the same device are grouped together in the UI

### 🔧 **Enhanced Configuration Options**
- **Device Information**: Include manufacturer, model, and version information
- **Availability Tracking**: Monitor device online/offline status
- **Customizable Discovery**: Configure discovery delay and retention settings
- **Backward Compatibility**: Falls back to legacy discovery if enhanced mode is disabled

### 📱 **Supported Entity Types**
- **Sensors**: Temperature, humidity, battery, etc.
- **Binary Sensors**: Motion, contact, smoke, etc.
- **Alarm Control Panel**: Security system status
- **Device Tracker**: Location and presence

## Configuration

### Addon Options

The following options are available in the Home Assistant addon configuration:

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `enhanced_auto_discovery` | boolean | `true` | Enable enhanced auto-discovery |
| `include_device_info` | boolean | `true` | Include device manufacturer/model info |
| `include_availability` | boolean | `true` | Track device online/offline status |
| `retain_discovery` | boolean | `true` | Retain discovery messages |
| `discovery_delay` | integer | `500` | Delay between discovery messages (ms) |

### Example Configuration

```yaml
# In your addon configuration
enhanced_auto_discovery: true
include_device_info: true
include_availability: true
retain_discovery: true
discovery_delay: 500
```

## How It Works

### 1. **Device Detection**
The addon automatically detects Homely devices and their sensors through the API.

### 2. **Discovery Publishing**
For each detected entity, the addon publishes a discovery message to MQTT:
```
homeassistant/sensor/homely_device123_temperature/config
```

### 3. **Entity Creation**
Home Assistant receives the discovery message and automatically creates the entity with:
- Proper device class and units
- Device grouping information
- Availability tracking
- State topic configuration

### 4. **State Updates**
The addon continuously publishes state updates to keep entities current.

## MQTT Topics

### Discovery Topics
- **Config**: `homeassistant/{component}/{unique_id}/config`
- **State**: `homely/{device_id}/{sensor_name}/state`
- **Availability**: `homely/{device_id}/online`

### Example Topics
```
homeassistant/sensor/homely_5f4b92db-2dfb-4169-8961-adc2f9c1f86a_temperature/config
homely/5f4b92db-2dfb-4169-8961-adc2f9c1f86a/temperature/state
homely/5f4b92db-2dfb-4169-8961-adc2f9c1f86a/online
```

## Device Grouping

All entities from the same device are automatically grouped together in Home Assistant:

```
Homely Device 5f4b92db-2dfb-4169-8961-adc2f9c1f86a
├── Temperature Sensor
├── Humidity Sensor
├── Motion Sensor
└── Battery Level
```

## Troubleshooting

### Devices Not Appearing
1. Check that `enhanced_auto_discovery` is enabled
2. Verify MQTT connection is working
3. Check addon logs for discovery messages
4. Ensure MQTT integration is enabled in Home Assistant

### Discovery Messages Not Working
1. Verify `discovery_prefix` is set to `homeassistant`
2. Check that MQTT broker supports retained messages
3. Ensure proper MQTT permissions

### Performance Issues
1. Increase `discovery_delay` if too many messages are sent at once
2. Disable `include_device_info` if not needed
3. Check MQTT broker performance

## Advanced Configuration

### Custom Device Names
You can customize device names by modifying the discovery payload in the source code.

### Custom Entity Categories
Entities can be assigned to specific categories (diagnostic, config, etc.) for better organization.

### Discovery Cleanup
The addon automatically cleans up discovery messages when:
- Devices are removed
- The addon is stopped
- The addon is restarted

## Migration from Legacy Discovery

If you're upgrading from the legacy discovery system:

1. **Backup**: Export your current Home Assistant configuration
2. **Enable**: Set `enhanced_auto_discovery: true`
3. **Restart**: Restart the addon
4. **Verify**: Check that entities appear with device grouping
5. **Cleanup**: Remove any manually configured MQTT entities

## Support

For issues or questions:
1. Check the addon logs for error messages
2. Verify MQTT broker configuration
3. Test MQTT connection manually
4. Check Home Assistant MQTT integration status

## Technical Details

### Discovery Payload Structure
```json
{
  "unique_id": "homely_device123_temperature",
  "name": "Temperature",
  "state_topic": "homely/device123/temperature/state",
  "availability_topic": "homely/device123/online",
  "device_class": "temperature",
  "unit_of_measurement": "°C",
  "device": {
    "identifiers": ["homely_device123"],
    "name": "Homely Device",
    "manufacturer": "Homely",
    "model": "Temperature Sensor"
  }
}
```

### Availability Payload
- **Online**: `online`
- **Offline**: `offline`

### State Payloads
- **Temperature**: `25.4` (numeric)
- **Motion**: `true`/`false` (boolean)
- **Contact**: `open`/`closed` (string)
- **Alarm**: `armed_home`/`armed_away`/`disarmed` (string)