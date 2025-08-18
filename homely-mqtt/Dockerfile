# Bruk Node 20 full Debian image (ikke slim)
FROM node:20-bullseye

# Installer nødvendige pakker for bygging av native modules
RUN apt-get update && apt-get install -y \
    git \
    python3 \
    python3-pip \
    python3-dev \
    build-essential \
    g++ \
    make \
    libc6-dev \
    bash \
    && ln -sf /usr/bin/python3 /usr/bin/python \
    && rm -rf /var/lib/apt/lists/*

# Oppdater npm til nyeste stabile versjon
RUN npm install -g npm@11.5.2

# Installer homely-mqtt fra GitHub
RUN npm install -g --unsafe-perm git+https://github.com/yusijs/homely-mqtt.git

# Eksponer MQTT port
EXPOSE 1883

# Default command
CMD ["homely-mqtt"]