#!/bin/bash

DO_RUN=${RUN:-true}
echo "Run? ${RUN:true}"

rm -rf /opt/operations
git clone https://github.com/jdcasey/osio-test.git /opt/operations

cd /opt/operations
if [ $RUN == true ]; then
	set -x
	ansible-playbook -i ./hosts -c local -e @/opt/config/osio-extras-jdcasey.yml -e push_changes=true "$@"
else
	exec /bin/bash -l
fi

