FROM alpine:3.7

RUN apk add --no-cache --virtual .build-dependencies g++ gcc git go && \
    go get github.com/hashicorp/consul-template && \
    mv "$(go env GOPATH)"/bin/consul-template /usr/bin/ && \
    rm -rf "$(go env GOPATH)" && \
    apk --no-cache add bash dnsmasq && \
    apk del .build-dependencies
COPY ./run /maison/run
COPY ./reload /maison/reload
COPY ./conf/web-services.ctmpl /maison/web-services.ctmpl
RUN chmod ug+rx /maison/run /maison/reload

EXPOSE 53 53/udp

ENTRYPOINT ["/maison/run"]
