FROM debian:9.3
ARG ola_version
ENV TERM linux
ENV ENV DEBIAN_FRONTEND noninteractive

# Install OLA.
RUN apt-get update && apt-get upgrade -y && apt-get install -y apt-utils && apt-get install -y ola \
    # Clean caches for a smaller build.
    && apt-get autoremove && apt-get clean && rm -rf /opt/ola.tar.gz && rm -rf /tmp/* /var/tmp/*

# The ola package creates an "olad" user and sets its home, but fails to create it.
RUN mkdir /usr/lib/olad
RUN chown olad:olad -R /usr/lib/olad
USER olad
# Disable unused OLA plugins.
RUN mkdir /usr/lib/olad/.ola/
RUN for pt in "artnet" "dummy" "e131" "espnet" "gpio" "karate" "kinet" "milinst" "opendmx" "openpixelcontrol" "osc" "pathport" "renard" "sandnet" "shownet" "spi" "stageprofi" "usbserial" "uartdmx" "usbdmx"; do echo "enabled = false" > /usr/lib/olad/.ola/ola-$pt.conf; done
# Enable FTDI devices.
# @todo Enable this again once the USB device exists.
#RUN echo "enabled = true" > /usr/lib/olad/.ola/ola-ftdidmx.conf

ENTRYPOINT olad

EXPOSE 9010
EXPOSE 9090
