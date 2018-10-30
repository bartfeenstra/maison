FROM consul:1.2.2

RUN apk --no-cache add bash esh

COPY ./conf /consul/config
COPY ./run /maison/run
RUN chmod ug+rx /maison/run

CMD ["/maison/run"]
