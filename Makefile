SHELL := /bin/bash

-include .env
-include .env.local
export 

export HOST_UID := $(shell id --user)
export HOST_USER := $(shell id --user --name)
export HOST_GID := $(shell id --group)
export HOST_GROUP := $(shell id --group --name)

up:
	@echo "export PUBLIC_IP=${HOST_IP}" > .scripts/bash/host.env
	@echo "export PROJECT_DIR=${project_dir}" >> .scripts/bash/host.env
	vagrant up
.PHONY: up

ssh:
	vagrant ssh
.PHONY: ssh

halt:
	vagrant halt
.PHONY: halt

destroy:
	vagrant destroy
.PHONY: destroy

reload:
	vagrant reload
.PHONY: reload

ssh-config:
	vagrant ssh-config
.PHONY: ssh-config

code-projects:	
	code --remote ssh-remote+${name} ${project_dir}/$(if $(project),$(project),)
.PHONY: code-projects


code-vps:	
	code --remote ssh-remote+curral
.PHONY: code-projects
