FROM nginx:1.13-alpine

COPY ./conf/* /etc/nginx/

RUN apk add --no-cache certbot

CMD ["nginx", "-g", "daemon off;"]

EXPOSE 80 443
