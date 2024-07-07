#!/bin/bash

# Copy configuration files from host to container
cp -r /conf_files/* /data/nginx/proxy_host/

# Reload Nginx service
/usr/sbin/nginx -s reload

# Keep the container running
tail -f /dev/null