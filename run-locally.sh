#!/bin/bash

if [ ! -d /tmp/generated-files ]; then
	mkdir -p /tmp/generated-files
fi

EXTRAS=osio-extras-$USER.yml

docker build -t local-operator local-docker
docker run --rm -ti -e RUN=$RUN -e EXTRAS_FILE=$EXTRAS -v /tmp/generated-files:/tmp/generated-files:Z -v $HOME/.nos:/opt/config:Z local-operator "$@"
