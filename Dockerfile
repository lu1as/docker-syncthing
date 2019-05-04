FROM alpine:latest

ARG SYNCHTING_VERSION=v1.1.1

LABEL maintainer="lukas.steiner@steinheilig.de"
LABEL repository="github.com/lu1as/docker-syncthing"
LABEL version=${SYNCHTING_VERSION}

ADD https://github.com/syncthing/syncthing/releases/download/${SYNCHTING_VERSION}/syncthing-linux-amd64-${SYNCHTING_VERSION}.tar.gz /syncthing.tar.gz

RUN tar -xzvf /syncthing.tar.gz -C /usr/local/bin syncthing-linux-amd64-${SYNCHTING_VERSION}/syncthing --strip-components 1 \
    && rm /syncthing.tar.gz \
    # user xfs holds uid 33
    && deluser xfs \
    && adduser -u 33 -D -h /var/syncthing -s /sbin/nologin syncthing

USER syncthing
WORKDIR /var/syncthing
ENV STNOUPGRADE=1
VOLUME [ "/var/syncthing" ]

CMD ["/usr/local/bin/syncthing", "-home", "/var/syncthing/config", "-gui-address", "0.0.0.0:8384"]
