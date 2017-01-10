FROM mongo:3.0
# https://hub.docker.com/_/mongo/

RUN mkdir -p /talus/logs/mongodb \
  && mkdir -p /talus/data/mongodb

ADD startup.sh /startup.sh

VOLUME /talus/logs
VOLUME /talus/data

CMD []
ENTRYPOINT ["/startup.sh"]
