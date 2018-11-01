FROM gitea/gitea:1.5

COPY ./run /maison/run

RUN chmod ug+rx /maison/run

ENTRYPOINT ["/maison/run"]
CMD ["/bin/s6-svscan", "/etc/s6"]
