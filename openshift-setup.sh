#!/bin/bash

source $HOME/.nos/osio-secrets-$USER.sh

$HOME/.nos/openshift-virtualenv/bin/ansible-playbook "$@" ./openshift-setup.yml