# OSOP

## Introduction

OSOP is short for OpenStack Operation toolkits.

## Installation

Install ansible.

```
pip install -U ansible
```

Install osop.

```
git clone https://github.com/tobegit3hub/osop.git

mv ./osop /root/

# Edit zj_hosts and zj
ls -s /root/osop/zj /bin/
```

## Usage

Run commands with ncurses.

```
zj
```

Run commands in cluster or nodes.

```
ansible -i zj_hosts api1 -m shell -a "ping -c 1 -W 1 127.0.0.1"
```

Run playbooks in cluster or nodes.

```
ansible-playbook -i zj_hosts ping-local.yaml
```
