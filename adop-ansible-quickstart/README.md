# Ansible playbooks and roles for ADOP/C Quickstart and Swarm on-premise installation

## How to use

* Clone the repository
* Make your host file. example:
```
adop-1 ansible_ssh_host=10.10.1.1
adop-2 ansible_ssh_host=10.10.1.2
adop-3 ansible_ssh_host=10.10.1.3
adop-4 ansible_ssh_host=10.10.1.4
adop-5 ansible_ssh_host=10.10.1.5
adop-6 ansible_ssh_host=10.10.1.6

[docker_engine]
adop-1
adop-2
adop-3
adop-4
adop-5
adop-6

[docker_swarm_manager]
adop-1 swarm_labels='["tool", "manager"]'
adop-2 swarm_labels='["tool", "manager"]'

[docker_swarm_worker]
adop-3 swarm_labels='["tool", "worker"]'
adop-4 swarm_labels='["tool", "worker"]'
adop-5 swarm_labels='["tool", "worker"]'
adop-6 swarm_labels='["tool", "worker"]'
```
* Modify quickstart.yml or swarm.yml playbook to change parameters according to your need (i.e. add company proxy details)
* Run in GitBash (or shell) command `docker-compose up`
* Enjoy :)

## After Platform is UP

1. Go to Kibana and create index choosing @timestamp in the below field.
1. Download Jenkins plugin https://repo.jenkins-ci.org/releases/org/biouno/uno-choice/1.5.3/uno-choice-1.5.3.hpi and upload it to Jenkins (not automated yet)