# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
    config.vm.hostname = "jenkins-bootstrap"
    config.vm.box = "generic/ubuntu1804"
    config.vm.provider "virtualbox" do |v|
        v.memory = 2048
        v.cpus = 2
    end
    config.vm.provider :libvirt do |libvirt|
        libvirt.memory = 2048
        libvirt.cpus = 2
        config.vm.synced_folder "./", "/vagrant", type: "nfs", nfs_version: 4, "nfs_udp": false, mount_options: ["rw", "vers=4", "tcp", "nolock"]
    end
    config.vm.network "forwarded_port", guest: 443, host: 4443, host_ip: "0.0.0.0"

    config.vm.provision "ansible_local" do |ansible|
      ansible.playbook = "provision.yml"
      ansible.become = true
      ansible.raw_arguments = ["--extra-vars ran_from_vagrant='true'"]
    end
end
