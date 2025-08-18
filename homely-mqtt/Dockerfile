# Bruk full Debian image med Node 20 (ikke slim)
FROM node:20-bullseye

# Installer byggverktøy og python
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
    curl \
    && ln -sf /usr/bin/python3 /usr/bin/python \
    && rm -rf /var/lib/apt/lists/*

# Oppdater npm til nyeste versjon
RUN npm install -g npm@11.5.2

# Lag midlertidig mappe og installer homely-mqtt der
RUN mkdir -p /tmp/homely && cd /tmp/homely \
    && npm install git+https://github.com/yusijs/homely-mqtt.git \
    && npm link

# Eksponer MQTT port
EXPOSE 1883

CMD ["homely-mqtt"]