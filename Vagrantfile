# -*- mode: ruby -*-
# vi: set ft=ruby :


# require 'yaml'

# env = YAML.load_file('env.yaml')


Vagrant.configure("2") do |config|
  config.vm.define ENV['name']
  config.vm.box = ENV['box']
  config.vm.network "private_network", ip: ENV['ipaddress']  
  config.vm.network "public_network", :bridge => ENV['bridge']  
  config.vm.hostname = ENV['hostname']
  
  config.ssh.forward_agent = true
  
  config.vm.provision "file", source: ".scripts/bash/host.env", destination: "/home/vagrant/.env", run: "always"
  config.vm.provision "shell", path: ".scripts/bash/init.sh"
  config.vm.provision "file", source: ".scripts/bash/.bash_login", destination: "/home/vagrant/.bash_login", run: "always"
  config.vm.provision "file", source: "~/.gitconfig", destination: ".gitconfig"

  config.vm.synced_folder ".", File.dirname(__FILE__), owner: Shellwords.escape(ENV['HOST_UID']), group: Shellwords.escape(ENV['HOST_GID'])

  config.vm.provider "virtualbox" do |vb|
    vb.name = ENV['name']
    vb.cpus = ENV['cpu']
    vb.memory = ENV['memory']
    vb.customize ["modifyvm", :id, "--groups", ENV['group']]
    vb.gui = false
    vb.linked_clone = true
    vb.check_guest_additions = true
  end
  
end

