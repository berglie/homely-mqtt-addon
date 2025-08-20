FROM node:18-alpine

ARG TARGETPLATFORM
# Create app directory
WORKDIR /app

# Copy package-install.sh
COPY source/package-install.sh ./

# Install build-dependencies on armv7 (not required on arm64)
ENV PYTHONUNBUFFERED=1
RUN ./package-install.sh

# Copy package.json and package-lock.json
COPY source/package*.json ./

# Install dependencies
RUN npm install --sqlite=/usr/local

# Copy app source code
COPY source/ .

# Build
RUN npm run build

# Copy configuration
COPY source/config/ /app/dist/config/

# Copy run script and make it executable
COPY source/run.sh /run.sh
RUN chmod +x /run.sh

# Set working directory to app directory (not /tmp/homely)
WORKDIR /app

# Set environment variables
ENV NODE_ENV=production
ENV HOMELY_MQTT_VERSION=1.1.5

# Expose MQTT port
EXPOSE 1883

# Set the entrypoint to our run script
ENTRYPOINT ["/run.sh"]