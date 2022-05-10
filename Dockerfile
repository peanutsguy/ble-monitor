FROM debian:buster-slim
LABEL org.opencontainers.image.source https://github.com/peanutsguy/ble-monitor

RUN apt update
RUN apt upgrade -y
RUN apt autoremove -y
RUN apt install -y git mosquitto mosquitto-clients bluez bluez-hcidump bc

RUN mkdir -p /app && cd /app
WORKDIR /app
RUN git clone https://github.com/peanutsguy/ble-monitor.git .
RUN mkdir /app/config

CMD ["bash","monitor.sh"]
