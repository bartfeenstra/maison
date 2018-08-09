FROM consul:1.2.2

RUN apk add --no-cache bash

COPY ./run /maison/run

RUN chmod ug+rx /maison/run

CMD ["/maison/run"]