#!/bin/bash

rm -rf /opt/operations
git clone https://github.com/jdcasey/osio-test.git /opt/operations

cd /opt/operations
ansible-playbook -i ./hosts -c local -e namespace=jdcasey-testing -e push_changes=true ./openshift-setup.yml
