FROM golang:1.16

# With go modules enabled there is no need to create a service dir in the normal GOPATH
ENV GO111MODULE on
ENV SERVICE_ROOT /service
ENV SERVICE_USER service

ADD https://raw.githubusercontent.com/articulate/docker-consul-template-bootstrap/master/install.sh /tmp/consul_template_install.sh
ADD https://raw.githubusercontent.com/articulate/docker-consul-template-bootstrap/master/wait-for-it.sh /wait-for-it.sh

RUN bash /tmp/consul_template_install.sh && rm /tmp/consul_template_install.sh \
    && useradd --create-home --home ${SERVICE_ROOT} --skel /dev/null --shell /bin/bash ${SERVICE_USER} \
    && chmod a+rx /wait-for-it.sh

WORKDIR ${SERVICE_ROOT}
USER ${SERVICE_USER}

ENTRYPOINT ["/entrypoint.sh"]
