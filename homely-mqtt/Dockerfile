# Bruk Node 18 slim image
FROM node:18-bullseye-slim

# Sett miljøvariabler for npm bygg
ENV NODE_ENV=production

# Installer nødvendige byggverktøy
RUN apt-get update && apt-get install -y \
    git \
    python3 \
    python3-pip \
    python3-dev \
    build-essential \
    g++ \
    make \
    libc6-dev \
    && ln -sf /usr/bin/python3 /usr/bin/python \
    && rm -rf /var/lib/apt/lists/*

# Oppdater npm til siste stabile versjon
RUN npm install -g npm@11.5.2

# Installer homely-mqtt fra GitHub med unsafe-perm
RUN npm install -g --unsafe-perm git+https://github.com/yusijs/homely-mqtt.git

# Eksponer MQTT port
EXPOSE 1883

# Sett standard kommando hvis nødvendig
CMD ["homely-mqtt"]