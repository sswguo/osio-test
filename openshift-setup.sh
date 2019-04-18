#!/bin/bash

$HOME/.nos/openshift-virtualenv/bin/ansible-playbook -e @/opt/config/osio-extras-jdcasey "$@" ./playbooks/openshift-setup.yml
