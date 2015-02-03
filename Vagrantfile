# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'fileutils'

ENV['VAGRANT_DEFAULT_PROVIDER'] = 'docker'

VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.network "forwarded_port", guest: 8080, host: 8080

  config.vm.post_up_message "connect to port 8080!"

  config.vm.provider "docker" do |d|
    d.image      = "marklee77/baseimage-python-docker"
    d.cmd        = ["/sbin/my_init", "--enable-insecure-key"]
    d.has_ssh    = true
    d.privileged = true
  end

  config.ssh.username = "root"
  config.ssh.private_key_path = "keys/phusion.key"

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "provisioning/getreqs.yml"
  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "provisioning/deploy.yml"
    ansible.extra_vars = {
      gitlab_http_port: 8080,
      gitlab_enable_ssl: false,
      gitlab_require_ssl: false,
      gitlab_ssh_port: "{{ ansible_ssh_port }}"
    }
  end

  #config.vm.provision "ansible" do |ansible|
  #  ansible.playbook = "provisioning/test.yml"
  #end

end
