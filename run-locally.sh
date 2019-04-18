#!/bin/bash

docker build -t local-operator local-docker
docker run --rm -ti -v $HOME/.nos/jdcasey-kube:/root/.kube -v $HOME/.nos:/etc/profile.d local-operator "$@"
