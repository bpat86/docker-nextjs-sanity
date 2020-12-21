FROM node:alpine as base
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY /nextjs/package*.json ./
RUN npm install

FROM node:alpine as dev
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY /nextjs/package*.json ./
RUN npm install
EXPOSE 3000
CMD ["npm", "run", "dev"]

FROM base as pre-prod
COPY . .
RUN npm ci
RUN npm run build

FROM node:alpine as prod
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY --from=pre-prod /usr/src/app/public ./public
COPY --from=pre-prod /usr/src/app/.next ./.next
COPY --from=pre-prod /usr/src/app/node_modules ./node_modules
EXPOSE 3000
CMD ["node_modules/.bin/next", "start"]