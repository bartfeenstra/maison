FROM python:3.6-jessie

RUN apt-get update \
    # Install Open Lighting Architecture
    && apt-get install -y ola \
    # Clean APT for a smaller build.
    && apt-get autoremove && apt-get clean \
    # Clean generic caches for a smaller build.
    && rm -rf /tmp/* /var/tmp/*

# The ola package creates an "olad" user and sets its home, but fails to create it.
RUN mkdir /usr/lib/olad
RUN chown olad:olad -R /usr/lib/olad

# Add Bash for debugging.
RUN sed -i "s/olad:\/bin\/false/olad:\/bin\/bash/g" /etc/passwd

#RUN su -l olad olad

ADD ./app /opt/alfred
WORKDIR /opt/alfred

RUN pip install -r requirements-dev-frozen.txt

#ENTRYPOINT ["uwsgi", "--http-socket", "0.0.0.0:5000", "-p", "4", "--manage-script-name", "--master", "--no-orphans", "--mount", "/=alfred_http.flask.entry_point:app", "--pyargv", "alfred_maison.extension.MaisonExtension"]

EXPOSE 5000
EXPOSE 9010
EXPOSE 9090
