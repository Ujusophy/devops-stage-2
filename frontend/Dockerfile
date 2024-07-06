FROM node:18-alpine3.18
WORKDIR /app
COPY package*.json .
RUN npm install 
COPY . .
RUN npm install vite --save-dev
EXPOSE 5173
CMD ["npm", "run", "dev", "--", "--host"]
