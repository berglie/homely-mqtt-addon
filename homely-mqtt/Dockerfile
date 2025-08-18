FROM node:18-alpine

# Installer homely-mqtt fra GitHub
RUN npm install -g git+https://github.com/yusijs/homely-mqtt.git

# Eksponer MQTT-port
EXPOSE 1883

# Start homely-mqtt
CMD ["homely-mqtt"]