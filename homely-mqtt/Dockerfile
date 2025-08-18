FROM node:18-bullseye-slim

# Installer git
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Installer homely-mqtt direkte fra GitHub
RUN npm install -g git+https://github.com/yusijs/homely-mqtt.git

# Eksponer MQTT-port
EXPOSE 1883

# Start homely-mqtt
CMD ["homely-mqtt"]