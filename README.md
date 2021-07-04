# VAGRANT KUBERNETES DEPLOYMENT WITH PYTHON APP MYSQL DB

The Main purpose of this project is to deploy singe kubernetes node and python application by single command which is 'vagrant up'. Also its important to redeploy application when source code changes with the least effort. 

Project consists of ansible roles which are neccessary to complete below steps when vagrant provisioning begins.
Step1: Configure Vagrant, MobaXterm and Virtualbox

Step2: Create Kubernetes single node node1 

Step3: Create Private Registry k8s-registry.local:5000  (user admin, password admin123)

Step4: Create User "developer" with "sudo" access (password qwe123)

Step5: Build Flask Application flask-gunicorn and push image to private registry

Step6: Deploy Mysql statefulset and Flask gunicorn application

Step7: Redeploy application when code changes by command "vagrant reload --provision-with=ansible_local or directly from node1

Depending of machine resources you may have to wait a few minutes for apps to run

if everything is ok then you can access application from browser http://192.168.50.10:30080/ 
Output is: Hello Devops 123, 1234!

## Download and Install Vagrant

https://www.vagrantup.com/downloads 

Use above link and download latest Vagrant exe on your Windows PC. Mydownload version is below:

(https://releases.hashicorp.com/vagrant/2.2.16/vagrant_2.2.16_x86_64.msi)


Run Vagrant.exe and install it.

## Download and Install Virtualbox

https://www.virtualbox.org/wiki/Downloads

Use above link and download latest Virtualbox exe on your Windows PC. Mydownload version is below:

https://download.virtualbox.org/virtualbox/6.1.22/VirtualBox-6.1.22-144080-Win.exe

## Download and Install Git

https://git-scm.com/download/win

My git exe file location is: /drives/c/Program\ Files/Git/bin/git.exe


## Download and Install MobaXterm

https://mobaxterm.mobatek.net/download-home-edition.html

Use above link and download latest MobaXterm on your Windows PC. Mydownload version is below:

https://download.mobatek.net/2122021051924233/MobaXterm_Installer_v21.2.zip



## Configure MobaXterm to run Vagrant.exe and Git

run MobaXterm -> Start localhost terminal

![](https://i.imgur.com/ghuOsyd.png)

![](https://i.imgur.com/S8263ye.png)



Run below command on MobaXterm terminal

```
cd $HOME
grep "configure mobaxterm to run vagrant and git" $HOME/.bashrc
if [ $? -ne 0 ]
then
cat << EOF >> $HOME/.bashrc
alias mygit="/drives/c/Program\ Files/Git/bin/git.exe"
# configure mobaxterm to run vagrant
PATH=$PATH:/drives/c/Windows/System32/WindowsPowerShell/v1.0:/drives/c/HashiCorp/Vagrant/bin:/drives/c/HashiCorp/Vagrant/embedded/bin:/drives/c/Program\ Files/Oracle/Virtualbox/
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/drives/c/HashiCorp/Vagrant/embedded/lib
export PATH 
export LD_LIBRARY_PATH
EOF
fi

```

Create a workspace on your partition or drives that you want to store your work. I will use my D: partition on my Windows.
```
cd /drives/d
mkdir vagrant_workspace
cd vagrant_workspace
```
![](https://i.imgur.com/fE34Qem.png)


Now we can initiliaze Vagrant and test environment
```

vagrant init ubuntu/bionic64
# if you have previous Vagrant plugins which are not compatiable you can run "vagrant plugin expunge --reinstall" this command and run vagrant init  again.
git clone https://github.com/aydemirkala/vagrant.git
cd vagrant
vagrant up


## Shutdown VM box name
vagrant halt ubuntu/bionic64

## remove box
vagrant box remove ubuntu/bionic64
vagrant box prune ubuntu/bionic64

## remove VM
vagrant.exe destroy

```

## BUILD PYTHON APP and REDEPLOY
```
cd /drives/d/vagrant_workspace/vagrant/
## You can change your application code on your MobaXterm and redeploy your application via Vagrant reload command
vi roles/python-src/files/pythonapp/flask-gunicorn/src/app.py
vagrant.exe reload --provision-with=ansible_local

## Or you can run ansible-playbook  inside node1 directly
cd /vagrant/
ansible-playbook -i hosts.ini roles.yml -t myflask -u developer -b -K -k 
```

