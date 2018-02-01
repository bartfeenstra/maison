FROM alpine:3.4

RUN apk add --no-cache certbot

RUN echo "41 6,15 * * * /usr/bin/certbot renew --no-self-upgrade" > /var/spool/cron/crontabs/certbot-renew

#ENTRYPOINT ["/usr/bin/certbot", "certonly", "--standalone", "-d"]
#ENTRYPOINT ["/usr/bin/bash"]
#CMD sleep 9
#CMD cert

#EXPOSE 80 443
