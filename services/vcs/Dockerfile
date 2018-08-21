FROM gitea/gitea:1.4

COPY ./conf/gitea/app.ini.envtpl /maison/app.ini.envtpl
COPY ./run /maison/run
RUN chmod ug+rx /maison/run

ENTRYPOINT ["/maison/run"]
CMD ["/bin/s6-svscan", "/etc/s6"]
