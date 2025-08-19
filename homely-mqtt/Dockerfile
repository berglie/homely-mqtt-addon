ARG BUILD_FROM
FROM $BUILD_FROM

# Install Node.js and necessary packages
RUN \
    apk add --no-cache \
        nodejs \
        npm \
        git \
        python3 \
        py3-pip \
        python3-dev \
        build-base \
        g++ \
        make \
        libc6-compat \
        bash \
        curl \
        jq

# Update npm to latest version
RUN npm install -g npm@11.5.2

# Copy the source code
COPY source/ /tmp/homely/

# Copy rootfs
COPY rootfs /

# Set working directory
WORKDIR /data/homely-mqtt

# Expose MQTT port
EXPOSE 1883