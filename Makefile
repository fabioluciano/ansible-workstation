SHELL := /bin/bash
PATH := ~/.local/bin:$(PATH)

all: execute_playbook

install_python:
	sudo apt install -y python

install_pip: install_python
	sudo apt install -y python-pip

install_ansible: install_pip
	pip install ansible --upgrade --user

execute_playbook: install_ansible
	ansible-playbook workstation.yml
