FROM node:18.19.1
WORKDIR /app
COPY package.json ./
COPY package-lock.json ./
RUN npm install
RUN npm install vite --save-dev
RUN npm run build
COPY . ./

FROM nginx:alpine
COPY --from=frontend /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
