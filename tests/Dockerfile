FROM dduportal/bats:0.4.0

MAINTAINER Damien DUPORTAL <damien.duportal@gmail.com>

RUN curl -LO https://get.docker.com/builds/Linux/x86_64/docker-latest.tgz \
  && tar zxf docker-latest.tgz \
  && mv ./docker/* /usr/bin/ \
  && rm -rf ./docker-latest.tgz ./docker

RUN LATEST_COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep tag_name | cut -d'"' -f4) \
  && curl -L -o /usr/local/bin/docker-compose \
    https://github.com/docker/compose/releases/download/${LATEST_COMPOSE_VERSION}/docker-compose-Linux-x86_64 \
  && chmod a+x /usr/local/bin/docker-compose
