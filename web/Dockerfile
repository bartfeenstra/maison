FROM nginx:1.13

RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y certbot iproute2 netcat python python-pip
RUN pip install jinja2

# @todo Remove /etc/nginx/conf.d/default.conf?
COPY ./conf/nginx.conf /etc/nginx/
COPY ./conf/conf.d/* /etc/nginx/conf.d/
COPY ./run /maison/run

RUN chmod ug+rx /maison/run

CMD ["bash", "/maison/run"]

EXPOSE 80 443
