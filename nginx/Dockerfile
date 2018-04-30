FROM nginx:1.13

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./server-common-ssl.conf /etc/nginx/server-common-ssl.conf
COPY ./location-auth.conf /etc/nginx/location-auth.conf
COPY ./location-proxy-common.conf /etc/nginx/location-proxy-common.conf

CMD ["nginx", "-g", "daemon off;"]

EXPOSE 80 443
