FROM fedora

VOLUME /opt/config

RUN dnf -y update
RUN dnf -y install python3 python3-pip libselinux-python3 git
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 0
RUN update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 0
RUN pip install --upgrade pip
RUN pip install openshift ansible

ADD run-operator.sh /usr/local/bin/run-operator.sh
RUN chmod +x /usr/local/bin/run-operator.sh

ENTRYPOINT ["/usr/local/bin/run-operator.sh"]
