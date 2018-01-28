FROM python:3.6-jessie

RUN apt-get update \
    # Install Open Lighting Architecture
    && apt-get install -y ola \
    # Clean APT for a smaller build.
    && apt-get autoremove && apt-get clean \
    # Clean generic caches for a smaller build.
    && rm -rf /tmp/* /var/tmp/*

ADD ./app /opt/alfred
WORKDIR /opt/alfred

RUN pip install -r requirements-dev-frozen.txt

ENTRYPOINT ["uwsgi", "--http-socket", "0.0.0.0:5000", "-p", "4", "--manage-script-name", "--master", "--no-orphans", "--mount", "/=alfred_http.flask.entry_point:app", "--pyargv", "alfred_maison.extension.MaisonExtension"]

EXPOSE 5000
EXPOSE 9010
EXPOSE 9090
