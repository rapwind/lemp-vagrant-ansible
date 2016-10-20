# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  #
  # vagrant box add centos-7.0 https://github.com/tommy-muehle/puppet-vagrant-boxes/releases/download/1.1.0/centos-7.0-x86_64.box
  #
  config.vm.box = "centos-7.0"

  config.vm.network "private_network", ip: "192.168.50.10", auto_config: false
  config.vm.network "forwarded_port", guest: 80, host: 80

  config.vm.provision "shell", inline: <<-SHELL
    sudo nmcli con mod "`nmcli -t -f name,device con | grep enp0s8 | tail -1 | cut -d":" -f1`" connection.id "enp0s8"
    sudo nmcli con mod enp0s8 ipv4.method manual ipv4.addresses '192.168.50.10/24'
    sudo systemctl restart network
  SHELL

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "provisioning/site.yml"
    ansible.inventory_path = "provisioning/local"
    ansible.limit = 'all'
  end

  config.vbguest.auto_update = false
  config.vm.synced_folder "html", "/var/www/html",
      create: true, owner: "vagrant", group: "vagrant"

  config.ssh.insert_key = false
end
