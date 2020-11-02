SHELL := /bin/bash
PATH := ~/.local/bin:$(PATH)

all: execute_playbook
.PHONY: all

install_python:
	sudo apt install -y python

install_pip: install_python
	sudo apt install -y python-pip-whl python3-pip

install_ansible: install_pip
	python3 -m pip install ansible --upgrade --user

install_ara: install_ansible
	python3 -m pip install --user ansible "ara[server]"

install_crudini: install_ara
	sudo apt install -y crudini

configure_ansible_cfg: install_crudini
	crudini --set ansible.cfg defaults callback_plugins $(shell python3 -m ara.setup.callback_plugins)
	crudini --set ansible.cfg defaults action_plugins $(shell python3 -m ara.setup.action_plugins)

execute_playbook: configure_ansible_cfg
	ansible-playbook workstation.yml -vvv

serve:
	ara-manage runserver
