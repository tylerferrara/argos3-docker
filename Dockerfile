# ARGOS INSTALL

FROM dorowu/ubuntu-desktop-lxde-vnc

WORKDIR /setup
COPY ./scripts /setup
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update
RUN /setup/argos-setup.sh

ENTRYPOINT [ "/startup.sh" ]
