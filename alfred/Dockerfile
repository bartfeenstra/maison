ARG alfred_version=master

FROM python:3.6-jessie

RUN apt-get install -y git
ARG alfred_version
RUN git clone --branch $alfred_version https://github.com/bartfeenstra/alfred.git /opt/alfred
WORKDIR /opt/alfred
RUN git checkout $alfred_version
RUN pip install -r requirements-dev-frozen.txt

ENTRYPOINT ["uwsgi", "--http-socket", "0.0.0.0:5000", "-p", "4", "--manage-script-name", "--master", "--no-orphans", "--mount", "/=alfred_http.flask.entry_point:app", "--pyargv", "alfred_maison.extension.MaisonExtension"]

EXPOSE 5000
