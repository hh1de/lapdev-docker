# Use the latest Debian as base
FROM debian:latest

# Install required packages with APT
RUN apt update && apt install curl sudo libcap2-bin -y

# Run install script and remove lapdev.conf (will be handled by init.sh script with environment variables)
RUN curl -L https://lap.dev/install.sh | sh && rm -rf /etc/lapdev.conf

# Save image size by clearing apt cache
RUN rm -rf /var/lib/apt/lists/*

# Run commands necessary to make lapdev run
RUN setcap 'cap_net_bind_service=+ep' /usr/bin/lapdev && sudo chown -R lapdev:lapdev /var/lib/lapdev/ && sudo chmod -R u+rwX /var/lib/lapdev/

# Copy the init script
COPY init.sh /home/init.sh

# Change the init script permissions so it can be ran
RUN chmod +x /home/init.sh

# Set the init script as entrypoint
ENTRYPOINT ["/home/init.sh"]