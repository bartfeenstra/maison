FROM alpine:3.7

RUN apk --no-cache add bash dnsmasq

COPY ./run /maison/run

EXPOSE 53 53/udp

ENTRYPOINT ["bash", "/maison/run"]
