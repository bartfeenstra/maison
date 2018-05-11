FROM nginx:1.14-alpine

RUN apk add --no-cache --virtual=.build-dependencies gcc libffi-dev python-dev musl-dev openssl-dev \
    && apk add --no-cache bash iproute2 socat python2 py2-pip \
    && pip2 install certbot certbot-nginx jinja2 \
    && apk del .build-dependencies && rm -rf /var/cache/apk/*

# @todo Remove /etc/nginx/conf.d/default.conf?
COPY ./conf/nginx.conf /etc/nginx/
COPY ./conf/conf.d/* /etc/nginx/conf.d/
COPY ./run /maison/run

RUN chmod ug+rx /maison/run

CMD ["bash", "/maison/run"]

EXPOSE 80 443
