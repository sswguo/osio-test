#!/bin/bash

DO_RUN=${RUN:-true}
echo "Run? $DO_RUN"
echo "Extras? $EXTRAS_FILE"

rm -rf /opt/operations
git clone https://github.com/jdcasey/osio-test.git /opt/operations

cd /opt/operations
if [ "$DO_RUN" == "false" ]; then
	echo "Starting debug shell"
	exec /bin/bash -l
else
	echo "Running playbook"

	if [ "x${EXTRAS_FILE}" != "x" ]; then
		EXTRAS="-e @/opt/config/$EXTRAS_FILE"
	fi

	set -x
	ansible-playbook -i ./hosts -c local $EXTRAS -e push_changes=true "$@"
fi

