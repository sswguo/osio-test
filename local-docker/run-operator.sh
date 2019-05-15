#!/bin/bash

shopt -s nullglob dotglob
files=(/etc/pki/ca-trust/source/anchors/*)
if [ ${#files[@]} -gt 0 ]; then
	update-ca-trust extract
fi

DO_RUN=${RUN:-true}
echo "Run? $DO_RUN"
echo "Extras? $EXTRAS_FILE"

rm -rf /opt/operations
git clone https://github.com/sswguo/osio-test.git /opt/operations
git checkout -b devel origin/devel

cd /opt/operations

# Copy the secret file into group vars
# ---
# k8s_host: api.starter-us-east-1.openshift.com
# k8s_user: wguo@redhat.com
# k8s_api_key: 
cp /opt/config/secret.yml ./group_vars/osio.yml

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

