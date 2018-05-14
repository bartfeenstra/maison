FROM openhab/openhab:2.2.0-amd64-debian

COPY ./run /maison/run

RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y gettext \
    # Clean caches for a smaller build.
    && apt-get autoremove \
    && apt-get clean \
    && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

RUN chmod ug+rx /maison/run

ENTRYPOINT ["bash", "/maison/run"]
CMD ["gosu", "openhab", "./start.sh"]
