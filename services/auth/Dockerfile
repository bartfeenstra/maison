FROM jboss/keycloak:4.3.0.Final

COPY  --chown=jboss:jboss ./conf/standalone.xml /opt/jboss/keycloak/standalone/configuration/standalone.xml

CMD ["-b", "0.0.0.0"]
