#!/bin/bash

if [ -z "$ISTIO_VERSION" ]; then
    echo "Variable ISTIO_VERSION is not set."
    exit 1
fi

if ! docker version; then 
    echo "Docker not found.  Please install docker and try again."
    exit 1
fi

if [ -e ./istio-${ISTIO_VERSION} ]; then
    echo "Skipping Istio download."
else
    # Download Istio
    curl -L https://istio.io/downloadIstio | ISTIO_VERSION=${ISTIO_VERSION} sh -
    mkdir samples
    cp -R istio-${ISTIO_VERSION}/samples/ samples
fi

# Build the docker image
docker build --build-arg ISTIO_VERSION -t willowmck/istioctl-samples:${ISTIO_VERSION} -t willowmck/istioctl-samples:latest .