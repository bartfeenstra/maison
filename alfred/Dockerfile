FROM python:3.6-jessie

RUN apt-get update \
    # Install Open Lighting Architecture
    && apt-get install -y ola \
    # Clean APT for a smaller build.
    && apt-get autoremove && apt-get clean \
    # Clean generic caches for a smaller build.
    && rm -rf /tmp/* /var/tmp/*

ADD . /opt/alfred

EXPOSE 9010
EXPOSE 9090
