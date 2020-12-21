FROM node:alpine

WORKDIR /usr/src/app

RUN npm install -g @sanity/cli

ENTRYPOINT ["sanity"]