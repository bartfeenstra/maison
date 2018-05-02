FROM nginx:1.13

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./server-common-ssl.conf /etc/nginx/server-common-ssl.conf
COPY ./location-auth.conf /etc/nginx/location-auth.conf
COPY ./location-proxy-common.conf /etc/nginx/location-proxy-common.conf
COPY ./run /etc/nginx/run

RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y iproute2 netcat

RUN chmod ug+rx /etc/nginx/run

CMD ["bash", "/etc/nginx/run"]

EXPOSE 80 443
