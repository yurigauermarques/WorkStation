# -*- mode: ruby -*-
# vi: set ft=ruby :


require 'yaml'

env = YAML.load_file('env.yaml')


Vagrant.configure("2") do |config|

  config.vm.define env['name']

  config.ssh.forward_agent = true

  config.vm.box = env['box']
  config.vm.hostname = env['hostname']
  config.vm.network "private_network", ip: env['ipaddress']
  
  config.vm.network "public_network", :bridge => env['bridge']
  config.vm.synced_folder env['project_dir'], "/projetos"
  config.vm.provider "virtualbox" do |vb|
    vb.name = env['name']
    vb.cpus = env['cpu']
    vb.memory = env['memory']
    vb.customize ["modifyvm", :id, "--groups", env['group']]
  end
  
  config.vm.provision "shell", path: env['provision']
  config.vm.provision "file", source: "~/.gitconfig", destination: ".gitconfig"
end

