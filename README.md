# Test setup for Ansible with Openshift

This is a testing ground for defining Openshift-based services using Ansible.

## Running Locally

Included is a Docker container configuration that will setup a clean environment with Ansible and Python 3 installed, then run the playbook you give it.

```
	$ export EXTRAS=/path/to/sensitive/vars.yml
	$ export CA_ROOT=/path/to/custom/cacert/dir
	# If you have local changes to test, you can use this. 
	# Otherwise, it will checkout this repository from GitHub and run playbooks from that. 
	$ export LOCAL_ANSIBLE=1
	$ ./run-locally.sh -e debug=true webhook-setup.yml
```

## Sensitive Variables

To get the Openshift token, you'll need the `oc` client installed, and you'll need to be logged in. Then use:

```
	$ oc whoami -t
```
