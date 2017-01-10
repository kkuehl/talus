FROM rabbitmq:latest
# https://github.com/docker-library/rabbitmq

RUN mkdir -p /talus/logs/rabbitmq \
  && chown rabbitmq:rabbitmq /talus/logs/rabbitmq \
  && mkdir -p /talus/data/rabbitmq \
  && chown rabbitmq:rabbitmq /talus/data/rabbitmq

# Change the default log locations from stdout
ENV RABBITMQ_LOG_BASE /talus/logs/rabbitmq
ENV RABBITMQ_MNESIA_BASE /talus/data/rabbitmq

VOLUME /talus/logs/rabbitmq

CMD ["rabbitmq-server"]



