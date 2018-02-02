ARG alfred_version=master

FROM python:3.6-stretch

ENV TERM linux
ENV ENV DEBIAN_FRONTEND noninteractive

COPY ./entrypoint.sh /opt/maison/entrypoint.sh
COPY ./ftdi.rules /etc/udev/rules.d/ftdi.rules

RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y apt-utils \
        sudo \
        ola \
        git \
    # Clean caches for a smaller build.
    && apt-get autoremove \
    && apt-get clean \
    && rm -rf /opt/ola.tar.gz \
    && rm -rf /tmp/* /var/tmp/*

# The ola package creates an "olad" user and sets its home, but fails to create it.
RUN mkdir /usr/lib/olad
RUN chown olad:olad -R /usr/lib/olad
USER olad
# Disable unused OLA plugins.
RUN mkdir /usr/lib/olad/.ola/
RUN for pt in "artnet" "dummy" "e131" "espnet" "gpio" "karate" "kinet" "milinst" "opendmx" "openpixelcontrol" "osc" "pathport" "renard" "sandnet" "shownet" "spi" "stageprofi" "usbserial" "uartdmx" "usbdmx"; do echo "enabled = false" > /usr/lib/olad/.ola/ola-$pt.conf; done
# Enable FTDI devices.
RUN echo "enabled = true" > /usr/lib/olad/.ola/ola-ftdidmx.conf

USER root
RUN git clone https://github.com/bartfeenstra/alfred.git /opt/alfred
WORKDIR /opt/alfred
ARG alfred_version
RUN git checkout $alfred_version
RUN pip install -r requirements-dev-frozen.txt

CMD sh /opt/maison/entrypoint.sh

EXPOSE 5000 9010 9090
