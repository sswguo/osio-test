#!/bin/bash

shopt -s nullglob dotglob
files=(/etc/pki/ca-trust/source/anchors/*)
if [ ${#files[@]} -gt 0 ]; then
	echo "Updating CA trust"
	update-ca-trust extract
fi

DO_RUN=${RUN:-true}
echo "Run? $DO_RUN"
echo "Extras? $EXTRAS_FILE"

set -x

if [ -d /opt/operations ]; then
	echo "Using ansible playbooks and roles from localhost"
else
	echo "Cloning ansible playbooks and roles..."
	git clone https://github.com/jdcasey/osio-test.git /opt/operations
fi

cd /opt/operations
if [ "$DO_RUN" == "false" ]; then
	echo "Starting debug shell"
	exec /bin/bash -l
else
	echo "Running playbook"

	if [ "x${EXTRAS_FILE}" != "x" ]; then
		EXTRAS="-e @/opt/config/$EXTRAS_FILE"
	fi

	ansible-playbook -i ./hosts -c local $EXTRAS -e push_changes=true "$@"
fi

