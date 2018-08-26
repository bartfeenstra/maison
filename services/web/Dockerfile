FROM nginx:1.14-alpine

RUN apk add --no-cache --virtual=.build-dependencies gcc libffi-dev python-dev musl-dev openssl-dev \
    && apk add --no-cache bash esh python2 py2-pip \
    && pip2 install certbot certbot-nginx \
    && apk del .build-dependencies && rm -rf /var/cache/apk/*

RUN wget -O /tmp/consul-template.tar.gz https://releases.hashicorp.com/consul-template/0.19.5/consul-template_0.19.5_linux_amd64.tgz && \
    tar -xzf /tmp/consul-template.tar.gz -C /usr/local/bin

RUN rm /etc/nginx/conf.d/default.conf
COPY ./conf/nginx.conf /etc/nginx/
COPY ./conf/conf.d/* /etc/nginx/conf.d/
COPY ./run /maison/run
COPY ./run /maison/reload
RUN chmod ug+rx /maison/run /maison/reload

CMD ["/maison/run"]

EXPOSE 80 443
