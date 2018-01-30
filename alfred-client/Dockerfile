ARG alfred_client_version=master

FROM node:9.4-stretch

ADD ./app /opt/alfred-client
WORKDIR /opt/alfred-client

RUN npm install

CMD ["/usr/local/bin/npm", "run", "dev", "--", "--host", "0.0.0.0", "--port", "80"]

EXPOSE 80
