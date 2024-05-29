#!/bin/bash

# Check if /etc/lapdev.conf exists and delete it if it does, so we can apply new environment variables with every restart
if [ -f /etc/lapdev.conf ]; then
    echo "Removing existing /etc/lapdev.conf"
    rm /etc/lapdev.conf
fi

# Create new /etc/lapdev.conf with the environment variables
echo "Creating new /etc/lapdev.conf with environment variables"
cat <<EOF > /etc/lapdev.conf
db = "postgres://${PG_USER}:${PG_PASS}@${PG_HOST}/lapdev"
bind = "0.0.0.0"
http-port = ${HTTP_PORT}
https-port = ${HTTPS_PORT}
ssh-proxy-port = ${SSH_PORT}
EOF

# Start /usr/bin/lapdev as user lapdev (required by lapdev), the main part
echo "Starting /usr/bin/lapdev as user lapdev"
sudo -u lapdev /usr/bin/lapdev