#!/bin/sh

yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install docker-ce
systemctl enable docker
systemctl start docker
yum install -y python-pip
pip install docker-compose
yum upgrade -y python*
yum install -y git
yum install -y nano
