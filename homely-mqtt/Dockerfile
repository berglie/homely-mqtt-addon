FROM node:18-bullseye-slim

ENV NODE_ENV=production

# Installer byggverktøy
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

# Installer homely-mqtt fra GitHub med unsafe-perm
RUN npm install -g --unsafe-perm git+https://github.com/yusijs/homely-mqtt.git

EXPOSE 1883

CMD ["homely-mqtt"]