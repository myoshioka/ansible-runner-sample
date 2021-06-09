# Ansible Runner Sample

- Sample of getting AWS information in Ansible Runner


# Requirement

- [Ansible Runner](https://github.com/ansible/ansible-runner)
- Docker & Docker-Compose


# Quick Start

```bash

$ git clone git@github.com:myoshioka/ansible-runner-sample.git
$ cd ansible-runner-sample
$ docker-compose up -d
$ docker exec ansible ansible-runner -p test.yml --cmdline "-e mfa_token=******" run /code/demo

```
