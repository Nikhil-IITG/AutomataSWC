FROM node:lts-alpine as build

WORKDIR usr/local/app

COPY package*.json ./

RUN npm ci --production

COPY . .

RUN npm install -g typescript && \tsc

EXPOSE 3100

CMD [ "node", "dist/index.js" ]