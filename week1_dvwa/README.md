# Week 1 - Dam Vulnerable Web App(DVWA)
This week we are using DVWA for our incident response demo. DVWA provides a broken webapp that is ready to be hacked out of the box. Docker was platform of choice because if a container becomes corrupted just restart it :).

## Setup demo
### AWS security group
0. Restrict AWS security group to RIT IP address range

### Setup DVWA on AWS Ubuntu 16.04
0. vim hosts and add IP addr of host under "[dvwa]"
0. ansible-playbook -i hosts deploy_dvwa.yml

### Access Docker container
0. ssh to host
0. docker exec -it dvwa bash

### Restart Docker container if corrupted
0. docker restart dvwa

## Perform attack
### Upload and unzip c99.php

### Overwrite the homepage


## Incident reponse demo
### Understanding the machine
It is important to understand the machine you are investigating


### Become the cyber detective


### Scripting challenges


### Red team challenge
Create a PHP reverse shell with Metasploit
