FROM openhab/openhab:2.2.0-amd64-debian

COPY ./run /maison/run

RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y gettext

RUN chmod ug+rx /maison/run

ENTRYPOINT ["bash", "/maison/run"]
CMD ["gosu", "openhab", "./start.sh"]
