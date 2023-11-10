# -*- mode: ruby -*-
# vi: set ft=ruby :


require 'yaml'

env = YAML.load_file('env.yaml')

Vagrant.configure("2") do |config|
  env.each do |env|
    config.vm.define env['name'] do |host|
      host.vm.box = env['box']
      host.vm.hostname = env['hostname']
      host.vm.network "private_network", ip: env['ipaddress']
      host.vm.network "public_network", :bridge => env['bridge']
      host.vm.synced_folder env['project_dir'], "/projetos"
      host.vm.provider "virtualbox" do |vb|
        vb.name = env['name']
        vb.cpus = env['cpu']
        vb.memory = env['memory']
        vb.customize ["modifyvm", :id, "--groups", env['group']]
      end
      host.vm.provision "file", source: ".ssh/config", destination: ".ssh/config"
      host.vm.provision "file", source: "~/.ssh/id_rsa", destination: ".ssh/id_rsa"
      host.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: ".ssh/id_rsa.pub"
      #host.vm.provision "shell", path: "init.sh" privileged false
      host.vm.provision "shell", path: "init.sh", privileged: false
      host.vm.provision "file", source: "~/.gitconfig", destination: ".gitconfig"
    end
  end
end

