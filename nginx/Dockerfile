FROM nginx:latest

# Install Certbot and the nginx plugin
RUN apt-get update && \
    apt-get install -y certbot python3-certbot-nginx && \
    rm -rf /var/lib/apt/lists/*

COPY ./init-letsencrypt.sh /init-letsencrypt.sh

RUN chmod +x /init-letsencrypt.sh

# RUN ./init-letsencrypt.sh

COPY ./nginx.conf /etc/nginx/conf.d/nginx.conf

RUN rm /etc/nginx/conf.d/default.conf

CMD ["nginx", "-g", "daemon off;"]
