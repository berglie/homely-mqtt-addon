#!/bin/bash

# Homely MQTT Add-on run script
# This script handles environment variables and starts the application

set -e

# Set default values if not provided
export MQTT_BROKER_HOST=${MQTT_BROKER_HOST:-"localhost"}
export MQTT_BROKER_PORT=${MQTT_BROKER_PORT:-1883}
export MQTT_USERNAME=${MQTT_USERNAME:-""}
export MQTT_PASSWORD=${MQTT_PASSWORD:-""}
export MQTT_CLIENT_ID=${MQTT_CLIENT_ID:-"homely_mqtt"}
export MQTT_TOPIC_PREFIX=${MQTT_TOPIC_PREFIX:-"homely"}
export LOG_LEVEL=${LOG_LEVEL:-"info"}
export AUTO_DISCOVERY=${AUTO_DISCOVERY:-"true"}
export DISCOVERY_PREFIX=${DISCOVERY_PREFIX:-"homeassistant"}

# Log configuration
echo "Starting Homely MQTT Add-on with configuration:"
echo "MQTT Broker: ${MQTT_BROKER_HOST}:${MQTT_BROKER_PORT}"
echo "Client ID: ${MQTT_CLIENT_ID}"
echo "Topic Prefix: ${MQTT_TOPIC_PREFIX}"
echo "Log Level: ${LOG_LEVEL}"
echo "Auto Discovery: ${AUTO_DISCOVERY}"
echo "Discovery Prefix: ${DISCOVERY_PREFIX}"

# Change to the homely-mqtt directory
cd /tmp/homely

# Start the application
echo "Starting homely-mqtt application..."
exec node index.js