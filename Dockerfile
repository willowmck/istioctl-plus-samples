ARG ISTIO_VERSION=latest

FROM istio/istioctl:${ISTIO_VERSION}

USER root
RUN mkdir -p /samples
COPY ./samples/ /samples/
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    sudo install kubectl /usr/local/bin/kubectl

RUN chown 1001 -R /samples
USER 1001