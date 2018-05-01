FROM nginx:1.13-alpine

COPY ./conf/* /etc/nginx/
COPY ./run /etc/nginx/run

RUN apk add --no-cache bash certbot

RUN chmod ug+rx /etc/nginx/run

CMD ["bash", "/etc/nginx/run"]

EXPOSE 80 443
