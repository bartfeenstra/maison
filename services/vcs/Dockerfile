FROM gitea/gitea:1.4

COPY ./run /maison/run

RUN chmod ug+rx /maison/run

ENTRYPOINT ["bash", "/maison/run"]
CMD ["/bin/s6-svscan", "/etc/s6"]
