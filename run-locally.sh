#!/bin/bash

if [ ! -d /tmp/generated-files ]; then
	mkdir -p /tmp/generated-files
fi

docker build -t local-operator local-docker
docker run --rm -ti -v /tmp/generated-files:/tmp/generated-files:Z -v $HOME/.nos:/opt/config:Z local-operator "$@"
