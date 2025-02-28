# -*- mode: ruby -*-
# vi: set ft=ruby :


# require 'yaml'

# env = YAML.load_file('env.yaml')


Vagrant.configure("2") do |config|
  config.vm.define ENV['name']
  config.vm.box = ENV['box']
  config.vm.network "private_network", ip: ENV['ipaddress']  
  config.vm.network "public_network", :bridge => ENV['bridge']  
  config.vm.network "forwarded_port", guest: 80, host: 1234 
  config.vm.hostname = ENV['hostname']
  
  config.ssh.forward_agent = true
  
  # config.vm.provision "shell", path: ".scripts/bash/init.sh"
  config.vm.provision "file", source: ".scripts/bash/20-xdebug.ini", destination: "/home/vagrant/20-xdebug.ini", run: "always"
  config.vm.provision "file", source: ".scripts/bash/host.env", destination: "/home/vagrant/.env", run: "always"
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

  # Ansible provisioner.
  config.vm.provision "ansible" do |ansible|
    ansible.compatibility_mode = "2.0"
    ansible.playbook = "provisioning/playbook.yml"
    # ansible.inventory_path = "provisioning/inventory"
    ansible.become = true
  end
  
end

