FROM golang:1.11

ENV SERVICE_ROOT /go/src/github.com/articulate/service
ENV SERVICE_USER service

ADD https://raw.githubusercontent.com/articulate/docker-consul-template-bootstrap/master/install.sh /tmp/consul_template_install.sh
RUN bash /tmp/consul_template_install.sh && rm /tmp/consul_template_install.sh

RUN mkdir -p $SERVICE_ROOT
RUN groupadd $SERVICE_USER && useradd --create-home --home $SERVICE_ROOT --gid $SERVICE_USER --shell /bin/bash $SERVICE_USER
WORKDIR $SERVICE_ROOT

ENTRYPOINT ["/entrypoint.sh"]
