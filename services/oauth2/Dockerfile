FROM alpine:3.8

ENV PATH "/root/go/bin:$PATH"

RUN apk add --no-cache --virtual .build-dependencies g++ git go && \
    go get github.com/bitly/oauth2_proxy && go clean -cache && \
    mv "$(go env GOPATH)"/bin/oauth2_proxy /usr/bin/ && \
    rm -rf "$(go env GOPATH)" && \
    apk del --purge .build-dependencies && \
    apk add --no-cache bash esh

COPY ./conf/oauth2_proxy.cfg.esh /etc/oauth2_proxy.cfg.esh
COPY ./run /maison/run
RUN chmod ug+rx /maison/run

CMD ["/maison/run"]
