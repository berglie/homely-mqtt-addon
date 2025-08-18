FROM node:18-bullseye-slim

# Installer systemverktøy for bygging av native dependencies
RUN apt-get update && \
    apt-get install -y git python3 g++ make build-essential && \
    rm -rf /var/lib/apt/lists/*

# Oppdater npm til siste versjon
RUN npm install -g npm@11.5.2

# Installer homely-mqtt fra GitHub
RUN npm install -g git+https://github.com/yusijs/homely-mqtt.git

# Eksponer MQTT-port
EXPOSE 1883

CMD ["homely-mqtt"]