FROM node:18-bullseye-slim

# Installer systemverktøy
RUN apt-get update && \
    apt-get install -y git python3 g++ make build-essential && \
    rm -rf /var/lib/apt/lists/*

# Installer homely-mqtt fra GitHub
RUN npm install -g git+https://github.com/yusijs/homely-mqtt.git

EXPOSE 1883

CMD ["homely-mqtt"]