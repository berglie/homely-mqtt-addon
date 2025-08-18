# Bruk Node 20 som base
FROM node:20-bullseye

# Installer nødvendige pakker
RUN apt-get update && \
    apt-get install -y git python3 python3-pip python3-dev build-essential g++ make libc6-dev bash curl && \
    ln -sf /usr/bin/python3 /usr/bin/python && \
    rm -rf /var/lib/apt/lists/*

# Oppdater npm til siste versjon
RUN npm install -g npm@11.5.2

# Klon homely-mqtt og installer lokalt
RUN git clone https://github.com/yusijs/homely-mqtt.git /tmp/homely && \
    cd /tmp/homely && \
    npm install && \
    npm link