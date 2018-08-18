FROM alpine:3.8

RUN apk add postfix supervisor

ADD ./conf/postfix/main.cf /etc/postfix/main.cf
ADD ./conf/supervisor /etc/supervisor.d

CMD supervisord -n
