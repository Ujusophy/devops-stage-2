FROM node:14 AS build
WORKDIR /app
COPY package.json ./
COPY package-lock.json ./
RUN npm install -g npm@latest
COPY . ./
RUN npm run build

FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
