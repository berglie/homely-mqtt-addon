FROM node:18-bullseye

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

RUN npm install -g npm@9

# Installer homely-mqtt lokalt og link
RUN mkdir -p /tmp/homely && cd /tmp/homely \
    && npm install git+https://github.com/yusijs/homely-mqtt.git \
    && npm link

EXPOSE 1883

CMD ["homely-mqtt"]