FROM node:18-bullseye-slim

ENV NODE_ENV=production

# Installer byggverktøy og bash
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

# Sett PATH for npm globale moduler
ENV PATH=/usr/local/lib/node_modules/.bin:$PATH

# Installer homely-mqtt fra GitHub med unsafe-perm
RUN npm install -g --unsafe-perm git+https://github.com/yusijs/homely-mqtt.git

EXPOSE 1883

CMD ["homely-mqtt"]