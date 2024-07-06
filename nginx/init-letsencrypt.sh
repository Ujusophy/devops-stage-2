#!/bin/bash

domains=(techynurse.site)
rsa_key_size=4096
data_path="./certbot"
email="sophyjelly718@gmail.com" # Adding a valid address is strongly recommended
staging=0 # Set to 1 if you're testing your setup to avoid hitting request limits

if [ -d "$data_path/conf/live/${domains[0]}" ]; then
  echo "Certificate already exists for ${domains[*]}."
else
  echo "### Creating 'webroot' directory in /var/www/certbot ..."
  mkdir -p "$data_path/www"
  echo "### Downloading recommended TLS parameters ..."
  mkdir -p "$data_path/conf"
  curl -s https://raw.githubusercontent.com/certbot/certbot/master/certbot/certbot/ssl-dhparams.pem > "$data_path/conf/ssl-dhparams.pem"

  echo "### Requesting Let's Encrypt certificate for ${domains[*]} ..."
  if [ $staging != "0" ]; then
    staging_arg="--staging"
  fi

  certbot certonly --webroot -w /var/www/certbot \
    --email $email \
    -d ${domains[*]} \
    --rsa-key-size $rsa_key_size \
    --agree-tos \
    --no-eff-email \
    $staging_arg

  echo "### Reloading nginx ..."
  nginx -s reload
fi
