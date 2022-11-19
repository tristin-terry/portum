FROM node:lts-alpine as build

WORKDIR /app

COPY package*.json ./

RUN npm ci

COPY . .

RUN npm run build

FROM nginx:stable-alpine as deploy

COPY --from=build /app/dist /usr/share/nginx/html