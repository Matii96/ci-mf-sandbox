FROM node:14.17-alpine AS ci-mf-sandbox

ENV APP_HOME=/usr/src/app

WORKDIR $APP_HOME
COPY package*.json ./
RUN npm install

COPY ./src ./src
COPY ./ ./
RUN npm run build
RUN rm -rf src

CMD ["node", "."]