FROM debian:buster-slim
LABEL org.opencontainers.image.source https://github.com/peanutsguy/ble-monitor

RUN apt update
RUN apt install -y git mosquitto mosquitto-clients bluez bluez-hcidump bc bluez dbus sudo curl

RUN mkdir -p /app && cd /app
WORKDIR /app
RUN git clone https://github.com/peanutsguy/ble-monitor.git .
RUN mkdir /app/config

COPY ./bluezuser.conf /etc/dbus-1/system.d/
RUN useradd -m bluezuser \
 && adduser bluezuser sudo \
 && passwd -d bluezuser
RUN chown -R bluezuser. /app
USER bluezuser

CMD ["bash","monitor.sh"]
