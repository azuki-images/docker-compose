FROM docker

# Install dependencies
RUN set -xe \
  && apk add --no-cache \
  bash \
  curl \
  && rm -rf /var/cache/apk/* /var/tmp/* /tmp/*

# Install docker-compose
ENV DOCKER_COMPOSE_VERSION 1.18.0

RUN set -xe \
  && curl -L https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose \
  && chmod +x /usr/local/bin/docker-compose \
  && docker-compose --version

CMD ["bash"]
