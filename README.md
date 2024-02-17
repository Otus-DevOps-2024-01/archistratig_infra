HW 3

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
