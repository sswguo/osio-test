#!/bin/bash

docker build -t local-operator local-docker
docker run --rm -ti -v $HOME/.nos:/opt/config:Z local-operator "$@"
