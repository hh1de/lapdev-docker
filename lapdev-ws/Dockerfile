# Use the latest Debian as base
FROM debian:latest

# Install required packages with APT
RUN apt update && apt install curl sudo fuse-overlayfs podman dbus-user-session golang-github-containernetworking-plugin-dnsname -y

# Set VERSION variable for manually downloading lapdev-ws (automatic installer uses systemd components which containers don't have)
ENV VERSION=0.1.0

# Download .dev with set Version from github and then install, afterwards remove .deb and clear apt cache, also lapdev-ws.conf (will be handled by init.sh script with environment variables)
RUN curl -sL -o /tmp/lapdev-ws_${VERSION}-1_amd64.deb https://github.com/lapce/lapdev/releases/download/v${VERSION}/lapdev-ws_${VERSION}-1_amd64.deb && \
    sudo apt install /tmp/lapdev-ws_${VERSION}-1_amd64.deb -y && \
    rm -rf /tmp/lapdev-ws_${VERSION}-1_amd64.deb && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /etc/lapdev-ws.conf

# Make contents of /etc/containers mountable AND persistent by copying and with help of init.sh
RUN mkdir /saves && \
    cp -r /etc/containers/* /saves/ && \
    rm -rf /etc/containers/*

# Copy the init script
COPY init.sh /home/init.sh

# Change the init script permissions so it can be ran
RUN chmod +x /home/init.sh

# Set the init script as entrypoint
ENTRYPOINT ["/home/init.sh"]