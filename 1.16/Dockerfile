# syntax=docker/dockerfile:1
FROM golang:1.16

# With go modules enabled there is no need to create a service dir in the normal GOPATH
ENV GO111MODULE on
ENV SERVICE_ROOT /service
ENV SERVICE_USER service

ARG TARGETARCH
ARG AWSCLI_VERSION=2.9.15
ADD --chmod=755 https://github.com/articulate/docker-consul-template-bootstrap/releases/latest/download/docker-consul-template-bootstrap_linux_${TARGETARCH} /entrypoint
ADD --chmod=755 https://raw.githubusercontent.com/vishnubob/wait-for-it/81b1373f17855a4dc21156cfe1694c31d7d1792e/wait-for-it.sh /wait-for-it.sh

RUN useradd --create-home --home ${SERVICE_ROOT} --skel /dev/null --shell /bin/bash ${SERVICE_USER} \
    # TODO: these packages will be removed in an upcoming release
    # if you want them, please copy to your Dockerfile
    && apt-get update -qq \
    && apt-get install --yes --no-install-recommends \
        unzip sudo jq wget curl ca-certificates \
    && apt-get clean && apt-get autoclean && apt-get -y autoremove --purge \
    && rm -rf /var/lib/apt/lists/* /usr/share/doc /root/.cache/ \
    && curl -s "https://awscli.amazonaws.com/awscli-exe-linux-$(uname -m)-${AWSCLI_VERSION}.zip" -o /tmp/awscliv2.zip \
    && unzip -d /tmp /tmp/awscliv2.zip \
    && /tmp/aws/install \
    && rm -rf /tmp/aws /tmp/awscliv2 /tmp/awscliv2.zip

WORKDIR ${SERVICE_ROOT}
USER ${SERVICE_USER}

ENTRYPOINT ["/entrypoint"]
