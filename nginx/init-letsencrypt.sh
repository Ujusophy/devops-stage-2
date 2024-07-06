#!/bin/sh

domains=(techynurse.site www.techynurse.site)
email="sophyjelly718@gmail.com"
staging=0 # Set to 1 if you're testing your setup to avoid hitting request limits

rsa_key_size=4096
data_path="/etc/letsencrypt"
config_path="/etc/letsencrypt/conf"
config_file="/etc/letsencrypt/options-ssl-nginx.conf"

if [ -d "$data_path" ]; then
  echo "Certificates already generated."
else
  mkdir -p "$data_path" "$config_path"
  echo "Creating dummy certificate for $domains ..."
  path="/etc/letsencrypt/live/$domains"
  mkdir -p "$path"
  openssl req -x509 -nodes -newkey rsa:1024 -days 1 -keyout "$path/privkey.pem" -out "$path/fullchain.pem"
  echo

  echo "Starting nginx ..."
  nginx -g 'daemon off;'
  echo

  echo "Deleting dummy certificate for $domains ..."
  rm -Rf "$data_path"
  echo

  echo "Requesting Let's Encrypt certificate for $domains ..."
  #Join $domains to -d args
  domain_args=""
  for domain in "${domains[@]}"; do
    domain_args="$domain_args -d $domain"
  done

  email_arg="--email $email" # Always set --email, even if empty
  if [ $staging != "0" ]; then staging_arg="--staging"; fi

  certbot certonly --webroot -w /var/www/certbot \
    $staging_arg \
    $email_arg \
    $domain_args \
    --rsa-key-size $rsa_key_size \
    --agree-tos \
    --force-renewal

  echo "Reloading nginx ..."
  nginx -s reload
fi

# Renew the certificate
while :; do
  sleep 12h
  certbot renew --quiet
  echo "Reloading nginx ..."
  nginx -s reload
done
