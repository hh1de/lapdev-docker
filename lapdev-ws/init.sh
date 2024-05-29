#!/bin/bash

# Check if /etc/containers/ is empty (because of mount) and if so, populate it with persistent folders generated from Dockerfile at /saves/
if [ -z "$(ls -A /etc/containers/)" ]; then
    echo "/etc/containers found empty, Populating it..."
    cp -r /saves/* /etc/containers/
fi

# Check if /etc/lapdev-ws.conf exists and delete it if it does, so we can apply new environment variables with every restart
if [ -f /etc/lapdev-ws.conf ]; then
    echo "Removing existing /etc/lapdev-ws.conf"
    rm /etc/lapdev-ws.conf
fi

# Create new /etc/lapdev-ws.conf with the environment variables
echo "Creating new /etc/lapdev-ws.conf with environment variables"
cat <<EOF > /etc/lapdev-ws.conf
bind = "0.0.0.0"
ws-port = ${WS_PORT}
inter-ws-port = ${INTER_WS_PORT}
EOF

# Start /usr/bin/lapdev-ws, the main part
echo "Starting /usr/bin/lapdev-wss"
/usr/bin/lapdev-ws