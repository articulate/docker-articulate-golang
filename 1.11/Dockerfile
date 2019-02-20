FROM golang:1.11

# No service root due to the necessity of it being in the GOPATH
ENV SERVICE_USER service
ADD https://raw.githubusercontent.com/articulate/docker-consul-template-bootstrap/master/install.sh /tmp/consul_template_install.sh
RUN bash /tmp/consul_template_install.sh && rm /tmp/consul_template_install.sh

ENTRYPOINT ["/entrypoint.sh"]
