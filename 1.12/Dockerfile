FROM golang:1.12

# With go modules enabled there is no need to create a service dir in the normal GOPATH
ENV GO111MODULE on
ENV SERVICE_ROOT /service
ENV SERVICE_USER service

ADD https://raw.githubusercontent.com/articulate/docker-consul-template-bootstrap/master/install.sh /tmp/consul_template_install.sh
RUN bash /tmp/consul_template_install.sh && rm /tmp/consul_template_install.sh

RUN mkdir -p $SERVICE_ROOT
RUN groupadd $SERVICE_USER && useradd --create-home --home $SERVICE_ROOT --gid $SERVICE_USER --shell /bin/bash $SERVICE_USER
WORKDIR $SERVICE_ROOT

ENTRYPOINT ["/entrypoint.sh"]
