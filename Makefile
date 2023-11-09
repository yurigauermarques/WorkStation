#!/usr/bin/make

up:
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
