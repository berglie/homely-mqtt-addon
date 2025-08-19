#!/usr/bin/with-contenv bashio
# shellcheck shell=bash
# ==============================================================================
# Configures Homely MQTT
# ==============================================================================

# Check if required configuration is set
bashio::config.require.username 'homely_user'
bashio::config.require.password 'homely_password'

# Log configuration values
bashio::log.info "Configuring Homely MQTT with:"
bashio::log.info "  MQTT Broker: $(bashio::config 'mqtt_broker_host'):$(bashio::config 'mqtt_broker_port')"
bashio::log.info "  Client ID: $(bashio::config 'mqtt_client_id')"
bashio::log.info "  Topic Prefix: $(bashio::config 'mqtt_topic_prefix')"
bashio::log.info "  Log Level: $(bashio::config 'log_level')"
bashio::log.info "  Auto Discovery: $(bashio::config 'auto_discovery')"
bashio::log.info "  Discovery Prefix: $(bashio::config 'discovery_prefix')"
bashio::log.info "  Homely User: $(bashio::config 'homely_user')"

# Create configuration directory
mkdir -p /data/homely-mqtt

# Copy source code to working directory
cp -r /tmp/homely/* /data/homely-mqtt/

# Install dependencies and build
cd /data/homely-mqtt
bashio::log.info "Installing dependencies..."
npm install
bashio::log.info "Building application..."
npm run build

# Set environment variables for the application
export MQTT_BROKER_HOST=$(bashio::config 'mqtt_broker_host')
export MQTT_BROKER_PORT=$(bashio::config 'mqtt_broker_port')
export MQTT_USERNAME=$(bashio::config 'mqtt_username')
export MQTT_PASSWORD=$(bashio::config 'mqtt_password')
export MQTT_CLIENT_ID=$(bashio::config 'mqtt_client_id')
export MQTT_TOPIC_PREFIX=$(bashio::config 'mqtt_topic_prefix')
export LOG_LEVEL=$(bashio::config 'log_level')
export AUTO_DISCOVERY=$(bashio::config 'auto_discovery')
export DISCOVERY_PREFIX=$(bashio::config 'discovery_prefix')
export HOMELY_USER=$(bashio::config 'homely_user')
export HOMELY_PASSWORD=$(bashio::config 'homely_password')

# Map to what the source code expects
export MQTT_HOST="mqtt://${MQTT_BROKER_HOST}:${MQTT_BROKER_PORT}"

bashio::log.info "Configuration complete!"