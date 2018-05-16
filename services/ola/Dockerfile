FROM debian:9-slim

ENV TERM linux
ENV ENV DEBIAN_FRONTEND noninteractive

COPY ./ftdi.rules /etc/udev/rules.d/ftdi.rules

RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y apt-utils \
        # OLA devices can be hot-swappable (USB), so we need `sudo ola_patch` to register them with OLA run-time.
        sudo \
        ola \
    # Clean caches for a smaller build.
    && apt-get autoremove \
    && apt-get clean \
    && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

# The ola package creates an "olad" user and sets its home, but fails to create the directory.
RUN mkdir /usr/lib/olad
RUN chown olad:olad -R /usr/lib/olad
RUN service olad start && sleep 1 \
    # Disable all OLA plugins.
    && bash -c 'for pid in {1..99}; do ola_plugin_state -p $pid -s disabled; done' \
    # Enable E1.31 (sACN).
    && ola_plugin_state -p 11 -s enabled \
    # Enable FTDI devices.
    && ola_plugin_state -p 13 -s enabled

USER olad

ENTRYPOINT ["olad", "-c", "/etc/ola"]

EXPOSE 9010 9090
