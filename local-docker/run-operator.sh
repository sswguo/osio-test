#!/bin/bash

rm -rf /opt/operations
git clone https://github.com/jdcasey/osio-test.git /opt/operations

cd /opt/operations
ansible-playbook -i ./hosts -c local -e @/opt/config/osio-extras-jdcasey -e push_changes=true ./openshift-setup.yml
