#!/bin/bash

if [ ! -d /tmp/generated-files ]; then
	mkdir -p /tmp/generated-files
fi

EXTRAS=${EXTRAS:-osio-extras-$USER.yml}

if [ "x${CA_ROOT}" != "x" ]; then
	ANCHORS="-v ${CA_ROOT}:/etc/pki/ca-trust/source/anchors:Z"
fi

if [ "${LOCAL_ANSIBLE:-0}" == 1 ]; then
	ANSIBLE="-v ${PWD}:/opt/operations:Z"
fi

which docker || sudo yum install docker && sudo systemctl start docker

docker build -t local-operator local-docker

set -x
docker run --rm -ti -e RUN=$RUN -e EXTRAS_FILE=$EXTRAS $ANCHORS $ANSIBLE -v /tmp/generated-files:/tmp/generated-files:Z -v $HOME/.nos:/opt/config:Z local-operator "$@"
