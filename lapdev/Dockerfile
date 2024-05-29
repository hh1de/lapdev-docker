FROM debian:latest

RUN apt update && apt install curl sudo libcap2-bin -y

RUN curl -L https://lap.dev/install.sh | sh && rm -rf /etc/lapdev.conf

RUN rm -rf /var/lib/apt/lists/*

RUN setcap 'cap_net_bind_service=+ep' /usr/bin/lapdev && sudo chown -R lapdev:lapdev /var/lib/lapdev/ && sudo chmod -R u+rwX /var/lib/lapdev/

COPY init.sh /home/init.sh

EXPOSE 80 443 2222

ENTRYPOINT ["/bin/bash su lapdev /home/init.sh"]