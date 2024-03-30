## HW 3

Cloud-bastion

bastion_IP = 51.250.15.65

someinternalhost_IP = 10.128.0.4

Prutinl server:
https://51.250.15.65/


Connection to someinternalhost in one command:
Using Jump host
ssh -A -J appuser@51.250.15.65 appuser@10.128.0.4

un1xoid@un1xoid-virtual-machine:~$ ssh -A -J appuser@51.250.15.65 appuser@10.128.0.4

appuser@someinternalhost:~$ hostname
someinternalhost


HW 3 additional task:

Create alias:

First solution:
temporary: alias someinternalhost='ssh -A -J appuser@51.250.15.65 appuser@10.128.0.4'
permament: alias someinternalhost='ssh -A -J appuser@51.250.15.65 appuser@10.128.0.4' >> ~/.bashrc

Second solution:
nano .ssh/config: 
Host someinternalhost 
HostName 10.128.0.4 
User appuser 
ProxyJump appuser@51.250.15.65

## HW4

cloud-testapp

testapp_IP = 158.160.47.148
testapp_port = 9292

yc command

yc compute instance create \
--name reddit-app \
--hostname reddit-app \
--memory=4 \
--create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-
lts,size=10GB \
--metadata-from-file user-data=startup.yaml \
--metadata serial-port-enable=1 \
--network-interface subnet-name=subnet,nat-ip-version=ipv4 \
--metadata-from-file user-data=startup.yaml
--metadata serial-port-enable=1 


## HW5 

Create boot disk with Packer. Get boot disk for VM. Use variables to create template for creating VM: packer validate -var-file=variables.json ubuntu16.json packer build -var-file=variables.json ubuntu16.json.
Create scripe for 'bake' create-reddit-vm.sh: packer validate -var-file=variables.json immutable.json packer build -var-file=variables.json immutable.json.

## HW6

Create VM from configuration. Create input variable for secret key, network zone and do terraform fmt. Create .gitignore and disable from pushing files with extensions .tf.

## HW7

 1. Create 2 virtual machine disk images: one with mongod and another with ruby (db.json and app.json)
 2. Split configuration file main.tf for using modules like app.tf and db.tf:
 3. Copy files app.tf and db.tf in folders: moludes/app and moludes/db and rename this files in main.tf. Create files: variables.tf and outputs.tf.
 4. Use terrform get to connect modules.
 5. Create folders: stage and prod. Copy main.tf, variables.tf, outputs.tf, terraform.tfvars, key.json into this folder.
 6. Edit paths to modules in main.tf.
 
## HW8
 1. Create inventory.yml
 
 app:
  hosts:
    appserver:
      ansible_host: 158.160.127.51

db:
  hosts:
    dbserver:
      ansible_host: 51.250.1.175
      
 2. Create playbook clone.yml
 - name: Clone
hosts: app
tasks:
- name: Clone repo
git:
repo: https://github.com/express42/reddit.git
dest: /home/appuser/reddit
 3. Use command 'ansible-playbook clone.yml' and delete ~/reddit with command:ansible app -m command -a 'rm -rf ~/reddit'
 
## HW9

1. Create playbook for db, app and deploy in 1 scenary: reddit_app_one_play.yml
2. Create playbook for db, app and deploy in 3 scenaries: reddit_app_multiple_plays.yml
3. Create 3 playbooks for db, app and deploy and main playbook:
	app.yml
	db.yml
	deploy.yml
	
Main playbook:
site.yml :
---
- import_playbook: db.yml
- import_playbook: app.yml
- import_playbook: deploy.yml

4. Create playbook for install ruby and bundler in app and mongodb in db for provisioning in Packer:
	packer_app.yml - install ruby and bundler
	packer_db.yml - install mongodb

5. Provisioning in Packer using playbooks:
app.json:
"provisioners": [
{
"type": "ansible",
"playbook_file": "ansible/packer_app.yml"
}
]
db.json:
"provisioners": [
{
"type": "ansible",
"playbook_file": "ansible/packer_db.yml"
}
]



## HW10

1. Move playbooks ins a roles
2. Create PROD and Stage environments
3. Create community role for nginx
4. Use Ansible-vault
