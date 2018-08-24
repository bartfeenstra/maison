FROM jboss/keycloak:4.3.0.Final

ENV PATH "/opt/jboss/keycloak/bin:$PATH"

COPY  --chown=jboss:jboss ./conf/kcadm.config.esh /opt/jboss/.keycloak/kcadm.config.esh
COPY --chown=jboss:jboss ./conf/standalone.xml /opt/jboss/keycloak/standalone/configuration/standalone.xml
COPY --chown=jboss:jboss ./run /maison/run
ADD --chown=jboss:jboss https://raw.githubusercontent.com/jirutka/esh/v0.1.1/esh /usr/local/bin/esh
RUN chmod ug+rx /maison/run /usr/local/bin/esh

ENTRYPOINT ["/maison/run"]
