FROM alpine:3
COPY bash/*.sh /opt
RUN /bin/sh /opt/install.sh; rm -f /opt/install.sh
EXPOSE 9000 46735
