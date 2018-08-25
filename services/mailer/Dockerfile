FROM alpine:3.8

RUN apk add --no-cache esh postfix rsyslog runit && \
    mkdir -p /var/spool/rsyslog

ADD conf/postfix/main.cf.esh /etc/postfix/main.cf.esh
ADD conf/rsyslog/rsyslog.conf /etc/rsyslog.conf
ADD ./conf/runit /runit

CMD /sbin/runsvdir /runit
