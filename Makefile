SHELL := /bin/bash
PATH := ~/.local/bin:$(PATH)

all: execute_playbook
.PHONY: all

install_python:
	sudo apt install -y python

install_pip: install_python
	sudo apt install -y python-pip

install_ansible: install_pip
	python3 -m pip install ansible --upgrade --user

install_ara: install_ansible
	python3 -m pip install --user ansible "ara[server]"

execute_playbook: install_ara
	ANSIBLE_CALLBACK_PLUGINS="$(shell python3 -m ara.setup.callback_plugins)" ansible-playbook workstation.yml -v