FROM alpine:3.8

RUN apk add --no-cache postfix rsyslog runit && \
    mkdir -p /var/spool/rsyslog

ADD conf/postfix/main.cf /etc/postfix/main.cf
ADD conf/rsyslog/rsyslog.conf /etc/rsyslog.conf
ADD ./conf/runit /runit

CMD /sbin/runsvdir /runit
