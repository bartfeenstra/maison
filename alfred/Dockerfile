FROM python:3.6-jessie

ADD ./app /opt/alfred
WORKDIR /opt/alfred

RUN pip install -r requirements-dev-frozen.txt

ENTRYPOINT ["uwsgi", "--http-socket", "0.0.0.0:5000", "-p", "4", "--manage-script-name", "--master", "--no-orphans", "--mount", "/=alfred_http.flask.entry_point:app", "--pyargv", "alfred_maison.extension.MaisonExtension"]

EXPOSE 5000
