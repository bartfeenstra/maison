FROM alpine:3.8

RUN apk add --no-cache bash curl docker jq

COPY ./register /maison/register
COPY ./deregister /maison/deregister
COPY ./run /maison/run
COPY ./watch /maison/watch
COPY ./conf/service.json.jq /maison/service.json.jq
RUN chmod ug+rx /maison/register /maison/deregister /maison/run /maison/watch

ENTRYPOINT ["/maison/run"]
