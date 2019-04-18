#!/bin/bash

rm -rf /opt/operations
git clone https://github.com/jdcasey/osio-test.git /opt/operations

cd /opt/operations
ansible-playbook -i ./hosts -e namespace=jdcasey-testing -e push_changes=yes ./openshift-setup.yml
