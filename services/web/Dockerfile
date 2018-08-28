FROM nginx:1.14-alpine

RUN apk add --no-cache --virtual .build-dependencies g++ gcc git go libffi-dev make python-dev musl-dev openssl-dev && \
    go get github.com/hashicorp/consul-template && \
    mv "$(go env GOPATH)"/bin/consul-template /usr/bin/ && \
    rm -rf "$(go env GOPATH)" && \
    apk add --no-cache bash esh python2 py2-pip && \
    pip2 install certbot certbot-nginx && \
    apk del .build-dependencies && \
    rm /etc/nginx/conf.d/default.conf

COPY ./conf/nginx.conf /etc/nginx/
COPY ./conf/conf.d/* /etc/nginx/conf.d/
COPY ./run /maison/run
COPY ./conf/web-services.ctmpl /maison/web-services.ctmpl
COPY ./reload /maison/reload
RUN chmod ug+rx /maison/run /maison/reload

CMD ["/maison/run"]

EXPOSE 80 443
