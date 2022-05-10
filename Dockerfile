FROM debian:buster-slim

RUN mkdir -p /app && cd /app
WORKDIR /app

RUN apt update
RUN apt upgrade -y
RUN apt autoremove -y
RUN apt install -y git mosquitto mosquitto-clients bluez bluez-hcidump bc
RUN git clone https://github.com/peanutsguy/ble-monitor.git .

CMD ["bash","monitor.sh"]
