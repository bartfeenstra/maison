FROM alpine:3.8

#RUN apk add --no-cache bash esh && \
#    mkdir -p /maison && \
#    wget -O /maison/oauth2_proxy https://github.com/bitly/oauth2_proxy/releases/download/v2.2/oauth2_proxy-2.2.0.linux-amd64.go1.8.1.tar.gz && \
#    tar -xzf /maison/oauth2_proxy --strip-components=1 -C /usr/bin && \
#    rm /maison/oauth2_proxy
#
#COPY ./conf/oauth2_proxy.cfg.esh /etc/oauth2_proxy.cfg.esh
#COPY ./run /maison/run
#RUN chmod ug+rx /maison/run
#
#CMD ["/maison/run"]

ENV PATH "/root/go/bin:$PATH"

RUN apk add --no-cache --virtual build-dependencies gcc g++ git go && \
    go get github.com/bitly/oauth2_proxy && \
    apk del build-dependencies && \
    apk add --no-cache bash esh

COPY ./conf/oauth2_proxy.cfg.esh /etc/oauth2_proxy.cfg.esh
COPY ./run /maison/run
RUN chmod ug+rx /maison/run

CMD ["/maison/run"]

