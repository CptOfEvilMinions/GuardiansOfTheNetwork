# Week 1 - Dam Vulnerable Web App(DVWA)
This week we are using DVWA for our incident response demo. DVWA provides a vulnerable webapp that is ready to be hacked out of the box.



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

# Resources/Sources
* https://www.computersecuritystudent.com/SECURITY_TOOLS/DVWA/DVWAv107/lesson14/index.html

### Understanding the machine
It is important to understand the machine you are investigating

0. What is the operating system(OS) of the attacked machine?
    1. Search query: `lsb_release -a`
    1. Answer: `Ubuntu 14.04.3 LTS`
0. What is the kernel of the attacked machine?
    1. Search query: `uname -a`
    1. Answer: `Linux 8aa914fd3a73 4.15.0-33-generic #36-Ubuntu SMP Wed Aug 15 16:00:05 UTC 2018 x86_64 x86_64 x86_64 GNU/Linux`
0. What is the timezone of the attacked machine?
    1. Search query: `timezone`
    1. Answer: `Europe/Stockholm`
0. What is the IP address of the attacked machine?
    1. Command: `ip a`
    1. Answer: `<Will vary>`
0. What is the MAC address of the attacked machine?
    1. Command: `ip a`
    1. Answer: `<Will vary>`
0. What is the hostname of the attacked machine?
    1. Command: `hostname`
    1. Answer: `<Will vary>`
0. What network services are listening on the attcked machine? -- include ports
    1. Command: `ss -l -n -t`
    1. Answer: SSH on port 22, MySQL on port 3306, Apache on port 80
0. What users are on the attacked machine?
    1. guardian, root

### Become the cyber detective
0. What are the version numbers of all the listening services?
    1. Search query: ``
    1. Answer: We can obtain a list of services that start at boot.
0. Do the services have any known vulnerabilities? What sources/tools did you use?
    1. 
0. Where are the web server logs located?
    1. Search query: ``
    1. Answer: `/var/log/apache2`
0. What is the timezone and time format of the webservers logs? Why does this matter?
    1. 
0. What is the hackers's IP address?
    1. Search query: ``
    1. Answer: ``
0. What is the hacker's user-agent?
    1. Search query: ``
    1. Answer: `nikto`, `Mozilla*`
0. What is the operating system(OS) of the hacker's machine?
    1. `Linux`
0. What webshell did the attacker use? 
    1. `c99.php`
0. Where was that webshell uploaded to?
    1. `/var/www/html/hackable/uploads`
0. What commands/actions did the attacker use?
    1. `whoami`, `ip a`, `hostname`, `cat /etc/passwd`, `ss -l -n -t`, `ps aux`, `arp -a`, `mysql -u root -e "show databases;"`, `mysql -u root -e "use dvwa; show tables"`, `mysqldump -u root --database dvwa`