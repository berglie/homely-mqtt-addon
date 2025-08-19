# Use Node 20 as base
FROM node:20-bullseye

# Install necessary packages
RUN apt-get update && \
    apt-get install -y git python3 python3-pip python3-dev build-essential g++ make libc6-dev bash curl jq && \
    ln -sf /usr/bin/python3 /usr/bin/python && \
    rm -rf /var/lib/apt/lists/*

# Update npm to latest version
RUN npm install -g npm@11.5.2

# Copy the source code
COPY source/ /tmp/homely/

# Build the TypeScript application
RUN cd /tmp/homely && \
    npm install && \
    npm run build

# Copy run script and make it executable
COPY run.sh /run.sh
RUN chmod +x /run.sh

# Set working directory
WORKDIR /tmp/homely

# Set environment variables
ENV NODE_ENV=production
ENV HOMELY_MQTT_VERSION=1.1.1

# Expose MQTT port
EXPOSE 1883

# Set the entrypoint to our run script
ENTRYPOINT ["/run.sh"]