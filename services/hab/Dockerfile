FROM openhab/openhab:2.2.0-amd64-debian

RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y gettext \
    # Clean caches for a smaller build.
    && apt-get autoremove \
    && apt-get clean \
    && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

COPY ./run /maison/run

RUN chmod ug+rx /maison/run

ENTRYPOINT ["/maison/run"]
CMD ["gosu", "openhab", "./start.sh"]
