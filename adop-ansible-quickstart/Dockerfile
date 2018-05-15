FROM centos:latest

RUN yum install -y epel-release \
    && yum -y update \
    && yum -y install ansible openssh-clients python-pip \
    && pip install --upgrade pip \
    # For ansible json_query jinja filter
    && pip install jmespath \
    && pip install netaddr \
    && mkdir /ansible

ADD host /etc/ansible/hosts

ENV ANSIBLE_HOST_KEY_CHECKING False
ENV ANSIBLE_REMOTE_TEMP '/tmp/ansible'
ENV ANSIBLE_FORCE_COLOR true
WORKDIR /ansible

RUN sed '/#pipelining = False/a pipelining = True' -i /etc/ansible/ansible.cfg && sed '/#special_context_filesystems=nfs,vboxsf,fuse,ramfs,9p/a special_context_filesystems=nfs' -i /etc/ansible/ansible.cfg
