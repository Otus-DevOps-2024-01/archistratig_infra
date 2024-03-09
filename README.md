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
