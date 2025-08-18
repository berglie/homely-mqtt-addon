FROM node:18-alpine

# Installer homely-mqtt
RUN npm install -g homely-mqtt

# Kjør homely-mqtt
CMD ["homely-mqtt"]
