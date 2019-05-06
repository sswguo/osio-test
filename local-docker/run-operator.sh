#!/bin/bash

DO_RUN=${RUN:-true}
echo "Run? $DO_RUN"

rm -rf /opt/operations
git clone https://github.com/jdcasey/osio-test.git /opt/operations

cd /opt/operations
if [ "$DO_RUN" == "false" ]; then
	echo "Starting debug shell"
	exec /bin/bash -l
else
	echo "Running playbook"

	set -x
	ansible-playbook -i ./hosts -c local -e @/opt/config/osio-extras-jdcasey.yml -e push_changes=true "$@"
fi

