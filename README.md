# istioctl plus samples
This Dockerfile will create a Docker image containing istioctl plus the samples directory.  You can use it by exec'ing into the container and running istioctl to do things like install bookinfo and other apps, install Istio, check configuration, etc.  This can also be utilized within a pipeline like Argo workflows to setup your Istio mesh.

This Docker image is based on the istio/istioctl docker image.

## Environment variables
You will need to set ISTIO_VERSION to the version required.  See https://hub.docker.com/r/istio/istioctl/tags?page=1&ordering=last_updated for a valid list of versions.

## Get this image

```
$ docker pull willowmck/istioctl-samples:latest
```

## Running the image

Get the version of Istio running in the cluster.

```
$ docker run --rm -v /path/to/your/kubeconfig:/.kube/config willowmck/istioctl-samples:latest version
```

## Run sample scripts 

Create an east-west gateway.

```
$ docker run --rm -v /path/to/your/kubeconfig:/.kube/config -it --entrypoint /bin/bash willowmck/istioctl-samples:latest /samples/multicluster/gen-eastwest-gateway.sh --single-cluster | /usr/local/bin/istioctl install -y -f -
```

## Run kubectl

Determine the version
```
$ docker run --rm -v /path/to/your/kubeconfig:/.kube/config --entrypoint /usr/local/bin/kubectl willowmck/istioctl-samples:latest version
```