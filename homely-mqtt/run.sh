#!/bin/bash

# Homely MQTT Add-on run script
# This script handles environment variables and starts the application

set -e

# Read configuration from add-on options
# Home Assistant addon options are available in /data/options.json
# We'll read from there and set environment variables accordingly

# Check if options.json exists and read configuration
if [ -f "/data/options.json" ]; then
    echo "Reading configuration from /data/options.json..."
    
    # Use jq to parse JSON and extract values
    if command -v jq >/dev/null 2>&1; then
        export MQTT_BROKER_HOST=$(jq -r '.mqtt_broker_host // "localhost"' /data/options.json)
        export MQTT_BROKER_PORT=$(jq -r '.mqtt_broker_port // 1883' /data/options.json)
        export MQTT_USERNAME=$(jq -r '.mqtt_username // ""' /data/options.json)
        export MQTT_PASSWORD=$(jq -r '.mqtt_password // ""' /data/options.json)
        export MQTT_CLIENT_ID=$(jq -r '.mqtt_client_id // "homely_mqtt"' /data/options.json)
        export MQTT_TOPIC_PREFIX=$(jq -r '.mqtt_topic_prefix // "homely"' /data/options.json)
        export LOG_LEVEL=$(jq -r '.log_level // "info"' /data/options.json)
        export AUTO_DISCOVERY=$(jq -r '.auto_discovery // "true"' /data/options.json)
        export DISCOVERY_PREFIX=$(jq -r '.discovery_prefix // "homeassistant"' /data/options.json)
        export ENHANCED_AUTO_DISCOVERY=$(jq -r '.enhanced_auto_discovery // "true"' /data/options.json)
        export INCLUDE_DEVICE_INFO=$(jq -r '.include_device_info // "true"' /data/options.json)
        export INCLUDE_AVAILABILITY=$(jq -r '.include_availability // "true"' /data/options.json)
        export RETAIN_DISCOVERY=$(jq -r '.retain_discovery // "true"' /data/options.json)
        export DISCOVERY_DELAY=$(jq -r '.discovery_delay // 500' /data/options.json)
        export HOMELY_PASSWORD=$(jq -r '.homely_password // ""' /data/options.json)
        export HOMELY_USER=$(jq -r '.homely_user // ""' /data/options.json)
        # Force MQTT to be enabled when using the addon
        export MQTT_ENABLED="true"
    else
        echo "WARNING: jq not available, using fallback method..."
        # Fallback: try to read from environment variables (Home Assistant might set these)
        export MQTT_BROKER_HOST=${MQTT_BROKER_HOST:-"localhost"}
        export MQTT_BROKER_PORT=${MQTT_BROKER_PORT:-1883}
        export MQTT_USERNAME=${MQTT_USERNAME:-""}
        export MQTT_PASSWORD=${MQTT_PASSWORD:-""}
        export MQTT_CLIENT_ID=${MQTT_CLIENT_ID:-"homely_mqtt"}
        export MQTT_TOPIC_PREFIX=${MQTT_TOPIC_PREFIX:-"homely"}
        export LOG_LEVEL=${LOG_LEVEL:-"info"}
        export AUTO_DISCOVERY=${AUTO_DISCOVERY:-"true"}
        export DISCOVERY_PREFIX=${DISCOVERY_PREFIX:-"homeassistant"}
        export ENHANCED_AUTO_DISCOVERY=${ENHANCED_AUTO_DISCOVERY:-"true"}
        export INCLUDE_DEVICE_INFO=${INCLUDE_DEVICE_INFO:-"true"}
        export INCLUDE_AVAILABILITY=${INCLUDE_AVAILABILITY:-"true"}
        export RETAIN_DISCOVERY=${RETAIN_DISCOVERY:-"true"}
        export DISCOVERY_DELAY=${DISCOVERY_DELAY:-500}
        export HOMELY_USER=${HOMELY_USER:-""}
        export HOMELY_PASSWORD=${HOMELY_PASSWORD:-""}
        # Force MQTT to be enabled when using the addon
        export MQTT_ENABLED="true"
    fi
elif [ -f "/config/homely-mqtt.yaml" ]; then
    echo "Reading configuration from /config/homely-mqtt.yaml..."
    # Try to read from a YAML config file if it exists
    export MQTT_BROKER_HOST=${MQTT_BROKER_HOST:-"localhost"}
    export MQTT_BROKER_PORT=${MQTT_BROKER_PORT:-1883}
    export MQTT_USERNAME=${MQTT_USERNAME:-""}
    export MQTT_PASSWORD=${MQTT_PASSWORD:-""}
    export MQTT_CLIENT_ID=${MQTT_CLIENT_ID:-"homely_mqtt"}
    export MQTT_TOPIC_PREFIX=${MQTT_TOPIC_PREFIX:-"homely"}
    export LOG_LEVEL=${LOG_LEVEL:-"info"}
    export AUTO_DISCOVERY=${AUTO_DISCOVERY:-"true"}
    export DISCOVERY_PREFIX=${DISCOVERY_PREFIX:-"homeassistant"}
    export ENHANCED_AUTO_DISCOVERY=${ENHANCED_AUTO_DISCOVERY:-"true"}
    export INCLUDE_DEVICE_INFO=${INCLUDE_DEVICE_INFO:-"true"}
    export INCLUDE_AVAILABILITY=${INCLUDE_AVAILABILITY:-"true"}
    export RETAIN_DISCOVERY=${RETAIN_DISCOVERY:-"true"}
    export DISCOVERY_DELAY=${DISCOVERY_DELAY:-500}
    export HOMELY_USER=${HOMELY_USER:-""}
    export HOMELY_PASSWORD=${HOMELY_PASSWORD:-""}
    # Force MQTT to be enabled when using the addon
    export MQTT_ENABLED="true"
else
    echo "WARNING: No configuration file found, using environment variables..."
    # Fallback to environment variables
    export MQTT_BROKER_HOST=${MQTT_BROKER_HOST:-"localhost"}
    export MQTT_BROKER_PORT=${MQTT_BROKER_PORT:-1883}
    export MQTT_USERNAME=${MQTT_USERNAME:-""}
    export MQTT_PASSWORD=${MQTT_PASSWORD:-""}
    export MQTT_CLIENT_ID=${MQTT_CLIENT_ID:-"homely_mqtt"}
    export MQTT_TOPIC_PREFIX=${MQTT_TOPIC_PREFIX:-"homely"}
    export LOG_LEVEL=${LOG_LEVEL:-"info"}
    export AUTO_DISCOVERY=${AUTO_DISCOVERY:-"true"}
    export DISCOVERY_PREFIX=${DISCOVERY_PREFIX:-"homeassistant"}
    export ENHANCED_AUTO_DISCOVERY=${ENHANCED_AUTO_DISCOVERY:-"true"}
    export INCLUDE_DEVICE_INFO=${INCLUDE_DEVICE_INFO:-"true"}
    export INCLUDE_AVAILABILITY=${INCLUDE_AVAILABILITY:-"true"}
    export RETAIN_DISCOVERY=${RETAIN_DISCOVERY:-"true"}
    export DISCOVERY_DELAY=${DISCOVERY_DELAY:-500}
    export HOMELY_USER=${HOMELY_USER:-""}
    export HOMELY_PASSWORD=${HOMELY_PASSWORD:-""}
    # Force MQTT to be enabled when using the addon
    export MQTT_ENABLED="true"
fi

# Map addon environment variables to what the source code expects
export MQTT_HOST="mqtt://${MQTT_BROKER_HOST}:${MQTT_BROKER_PORT}"

# Validate required configuration
if [ -z "$HOMELY_USER" ]; then
    echo "ERROR: HOMELY_USER is not set. Please configure it in the addon options."
    echo "Current configuration values:"
    echo "  MQTT_BROKER_HOST: ${MQTT_BROKER_HOST}"
    echo "  MQTT_BROKER_PORT: ${MQTT_BROKER_PORT}"
    echo "  MQTT_CLIENT_ID: ${MQTT_CLIENT_ID}"
    echo "  MQTT_TOPIC_PREFIX: ${MQTT_TOPIC_PREFIX}"
    echo "  LOG_LEVEL: ${LOG_LEVEL}"
    echo "  AUTO_DISCOVERY: ${AUTO_DISCOVERY}"
    echo "  DISCOVERY_PREFIX: ${DISCOVERY_PREFIX}"
    echo "  ENHANCED_AUTO_DISCOVERY: ${ENHANCED_AUTO_DISCOVERY}"
    echo "  INCLUDE_DEVICE_INFO: ${INCLUDE_DEVICE_INFO}"
    echo "  INCLUDE_AVAILABILITY: ${INCLUDE_AVAILABILITY}"
    echo "  RETAIN_DISCOVERY: ${RETAIN_DISCOVERY}"
    echo "  DISCOVERY_DELAY: ${DISCOVERY_DELAY}"
    echo "  HOMELY_USER: ${HOMELY_USER:-'NOT SET'}"
    echo "  HOMELY_PASSWORD: ${HOMELY_PASSWORD:-'NOT SET'}"
    exit 1
fi

if [ -z "$HOMELY_PASSWORD" ]; then
    echo "ERROR: HOMELY_PASSWORD is not set. Please configure it in the addon options."
    exit 1
fi

# Debug: Print all environment variables to see what's available
echo "Available environment variables:"
env | grep -E "(MQTT_|HOMELY_|LOG_|AUTO_|DISCOVERY_|ENHANCED_|INCLUDE_|RETAIN_)" | sort
echo ""

# Check if options.json exists and show its contents for debugging
if [ -f "/data/options.json" ]; then
    echo "Contents of /data/options.json:"
    cat /data/options.json | jq '.' 2>/dev/null || echo "Failed to parse JSON"
    echo ""
fi

# Log configuration
echo "Starting Homely MQTT Add-on with configuration:"
echo "MQTT Broker: ${MQTT_BROKER_HOST}:${MQTT_BROKER_PORT}"
echo "Client ID: ${MQTT_CLIENT_ID}"
echo "Topic Prefix: ${MQTT_TOPIC_PREFIX}"
echo "Log Level: ${LOG_LEVEL}"
echo "Auto Discovery: ${AUTO_DISCOVERY}"
echo "Discovery Prefix: ${DISCOVERY_PREFIX}"
echo "Enhanced Auto Discovery: ${ENHANCED_AUTO_DISCOVERY}"
echo "Include Device Info: ${INCLUDE_DEVICE_INFO}"
echo "Include Availability: ${INCLUDE_AVAILABILITY}"
echo "Retain Discovery: ${RETAIN_DISCOVERY}"
echo "Discovery Delay: ${DISCOVERY_DELAY}ms"
echo "MQTT Enabled: ${MQTT_ENABLED:-"true"}"
echo "Homely User: ${HOMELY_USER}"

# Change to the homely-mqtt directory
cd /tmp/homely

# Create a custom config file to override the default settings
echo "Creating custom configuration to enable MQTT..."
cat > config/local.yml << EOF
database:
  logLevel: ${LOG_LEVEL:-info}
  reset: false
  connection:
    username: user
    password: password
    storage: db.sqlite
    host: localhost
    dialect: sqlite

mqtt:
  enabled: true
  qos: 1
  host: mqtt://${MQTT_BROKER_HOST}:${MQTT_BROKER_PORT}
  user: ${MQTT_USERNAME:-homely}
  entityPrefix: ${MQTT_TOPIC_PREFIX:-homely}
  topicPrefixes:
    config: ${DISCOVERY_PREFIX:-homeassistant}
    state: ${MQTT_TOPIC_PREFIX:-homely}

homely:
  host: sdk.iotiliti.cloud

logLevel: ${LOG_LEVEL:-info}

polling:
  schedule: "*/5 * * * *"
EOF

echo "Custom configuration created:"
cat config/local.yml

# Start the application
echo "Starting homely-mqtt application..."
exec node dist/index.js