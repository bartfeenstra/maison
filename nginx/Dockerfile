FROM nginx:1.13

COPY ./conf/* /etc/nginx/
COPY ./run /maison/run

RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y certbot iproute2 netcat

RUN chmod ug+rx /maison/run

CMD ["bash", "/maison/run"]

EXPOSE 80 443
