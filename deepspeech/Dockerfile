ARG deepspeech_version='0.1.1'

FROM python:3.6-stretch

ENV TERM linux
ENV ENV DEBIAN_FRONTEND noninteractive

RUN mkdir /opt/deepspeech
ARG deepspeech_version
RUN curl -L -o /opt/deepspeech/models.tar.gz "https://github.com/mozilla/DeepSpeech/releases/download/v${deepspeech_version}/deepspeech-${deepspeech_version}-models.tar.gz" \
    && tar -C /opt/deepspeech -xzf /opt/deepspeech/models.tar.gz \
    && rm -r /opt/deepspeech/models.tar.gz

RUN pip3 install deepspeech deepspeech-server

COPY ./config.json /opt/deepspeech/config.json

ENTRYPOINT ["deepspeech-server", "--config", "/opt/deepspeech/config.json"]

EXPOSE 80
