FROM jboss/keycloak:4.3.0.Final

ENV PATH "/opt/jboss/keycloak/bin:$PATH"

USER root
RUN curl -o /usr/bin/wait-for-it https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh
RUN chmod ugo+rx /usr/bin/wait-for-it
USER jboss

COPY  --chown=jboss:jboss ./conf/kcadm.config.esh /opt/jboss/.keycloak/kcadm.config.esh
COPY --chown=jboss:jboss ./run /maison/run
ADD --chown=jboss:jboss https://raw.githubusercontent.com/jirutka/esh/v0.1.1/esh /usr/local/bin/esh
RUN chmod ug+rx /maison/run /usr/local/bin/esh

ENTRYPOINT ["/maison/run"]
