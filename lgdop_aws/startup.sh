#!/bin/sh

yum install -y yum-utils
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install -y http://mirror.centos.org/centos/7/extras/x86_64/Packages/container-selinux-2.33-1.git86f33cd.el7.noarch.rpm
yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-$(rpm -E '%{rhel}').noarch.rpm
yum install -y docker-ce
systemctl restart docker
systemctl enable docker 
yum install -y python-pip
pip install docker-compose
yum upgrade -y python*
yum install -y git
yum install -y nano

