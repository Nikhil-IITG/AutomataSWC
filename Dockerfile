FROM ghcr.io/puppeteer/puppeteer:21.3.6

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
        PUPPETEER_EXECUTABLE_PATH=/usr/bin/google-chrome-stable

FROM node:lts-alpine

WORKDIR /usr/src/app
COPY package*.json ./
RUN npm ci --production

COPY . .

# Install TypeScript globally
RUN npm install -g typescript

# Build the TypeScript code
RUN tsc

# Expose the desired port (replace 3000 with your application's port)
EXPOSE 8080

# Start the application
CMD [ "node", "dist/index.js" ]