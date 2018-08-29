FROM alpine:3.8

RUN apk --no-cache add bash dnsmasq && \
    wget -O /tmp/consul-template.tar.gz https://releases.hashicorp.com/consul-template/0.19.5/consul-template_0.19.5_linux_amd64.tgz && \
    tar -xzf /tmp/consul-template.tar.gz -C /usr/local/bin && \
    rm -r /tmp/*

COPY ./run /maison/run
COPY ./reload /maison/reload
COPY ./conf/web-services.ctmpl /maison/web-services.ctmpl
RUN chmod ug+rx /maison/run /maison/reload

EXPOSE 53 53/udp

ENTRYPOINT ["/maison/run"]
