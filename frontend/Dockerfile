FROM node:18.19.1
WORKDIR /app
COPY package.json ./
COPY package-lock.json ./
RUN npm install
RUN npm install vite --save-dev
COPY . ./
RUN npm run build

FROM nginx:alpine
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
