# -*- mode: ruby -*-
# vi: set ft=ruby :

IMAGE_NAME = "ubuntu/bionic64"

Vagrant.configure("2") do |config|
  config.ssh.insert_key = false
  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 2
    v.name = "node1"
  end
  config.vm.define "node1" do |node|
    node.vm.box = IMAGE_NAME
    node.vm.network "private_network", ip: "192.168.50.10"
    node.vm.hostname = "node1"
  end
  config.vm.provision "shell", inline: <<-SHELL
     hostnamectl set-hostname node1 --static
     apt-get update
     apt-get install ansible -y
     cd /vagrant
     ansible-playbook -i hosts.ini roles.yml
     #rm -rf playbook.yaml roles
     #echo "qwe123" | passwd --stdin root
     #usermod -s /bin/nologin vagrant
     useradd -d /home/developer -m -s /bin/bash -G sudo -c "developer" developer -p "saDQlQyMjc4KA"
     mkdir /home/developer/.kube
     cp /etc/kubernetes/admin.conf /home/developer/.kube/config
     chown -R developer:developer /home/developer/.kube
     sed -i "s/PasswordAuthentication no/PasswordAuthentication yes/g" /etc/ssh/sshd_config
     systemctl restart sshd
     shutdown -r now
     SHELL
  config.vm.provision "ansible_local" do |ansible|
     ansible.inventory_path = "hosts.ini"
     ansible.playbook = "roles.yml"
     ansible.tags = "myflask"
  end
end


 
