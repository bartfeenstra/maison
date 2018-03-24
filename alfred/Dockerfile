ARG alfred_version=master

FROM python:3.6-stretch

ENV TERM linux
ENV ENV DEBIAN_FRONTEND noninteractive

COPY ./entrypoint.sh /opt/maison/entrypoint.sh
COPY ./ftdi.rules /etc/udev/rules.d/ftdi.rules

RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y apt-utils \
        ola \
        git \
    # Clean caches for a smaller build.
    && apt-get autoremove \
    && apt-get clean \
    && rm -rf /opt/ola.tar.gz \
    && rm -rf /tmp/* /var/tmp/*

# The ola package creates an "olad" user and sets its home, but fails to create the directory.
RUN mkdir /usr/lib/olad
RUN chown olad:olad -R /usr/lib/olad
RUN service olad start && sleep 1 \
    # Disable all OLA plugins.
    && bash -c 'for pid in {0..16}; do ola_plugin_state -p $pid -s disabled; done' \
    # Enable FTDI devices.
    && ola_plugin_state -p 13 -s enabled

RUN git clone https://github.com/bartfeenstra/alfred.git /opt/alfred
WORKDIR /opt/alfred
ARG alfred_version
RUN git checkout $alfred_version
RUN pip install -r requirements-dev-frozen.txt

CMD sh /opt/maison/entrypoint.sh

EXPOSE 5000 9010 9090
