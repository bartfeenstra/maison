ARG alfred_client_version=master

FROM node:9.4-stretch

RUN apt-get install -y git
ARG alfred_client_version
RUN git clone https://github.com/bartfeenstra/alfred-client.git /opt/alfred-client
WORKDIR /opt/alfred-client
RUN git checkout $alfred_client_version
RUN npm install
RUN ["/usr/local/bin/npm", "run", "build"]
RUN mkdir www
RUN cp index.html ./www/index.html
RUN cp -R dist ./www/dist

CMD tail -f /dev/null

EXPOSE 80
