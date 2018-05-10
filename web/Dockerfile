FROM nginx:1.13-alpine

RUN apk add --no-cache bash certbot iproute2 socat python2 py2-pip
RUN pip2 install jinja2

# @todo Remove /etc/nginx/conf.d/default.conf?
COPY ./conf/nginx.conf /etc/nginx/
COPY ./conf/conf.d/* /etc/nginx/conf.d/
COPY ./run /maison/run

RUN chmod ug+rx /maison/run

CMD ["bash", "/maison/run"]

EXPOSE 80 443
