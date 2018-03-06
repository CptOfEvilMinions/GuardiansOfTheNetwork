# Post red team

## Presentation
Post red team: https://docs.google.com/presentation/d/1gE5ScvxbL9my0a233l9EUIj0EHkpWrKp5XdH0swXvVA/edit?usp=sharing 

## Demo setup
### Setup Graylog
0. mv group_vars/all.example group_vars/all
0. vim group_vars/all and set
    1. base_domain
    1. graylog_admin_password
0. vim hosts and set [graylog]
0. ansible-playbook -i hosts deploy_graylog.yml -u [user]

### Setup Windows agents

## Demo
### Lookup 
0. Service accounts:
    1. The three service accounts on Windows?
    1. Give an example of a service/program that will use each service account?
0. What is the Windows Event ID(EID) and description for:
    1. Successful Logon?
    1. Failed logon? 
    1. User account created?
    1. Service creation?
    1. Process creation?
    1. Password change?
0. Logon types:
    1. Difference between interactive and non-interactive logon
    1. What are the nine logon types?
    1. What is an example of an interactive logon?
    1. What is an example of a non-interactive logon?

### Sysinternals - Process Explorer
0. What do the colors represent?
0. How do you verify a process?
0.  

### Sysinternals - TCPView

### Sysinternals - Procmon

### Sysinternals - Autoruns

### Event Viewer - Stop service
0. Open a run prompt
0. Enter "services.msc"
0. Find "Windows Updates" and STOP service
0. Refresh Event Viewer find the EID
0. What is the:
    1. What is service name?
    1. What is the user that did the action?
    1. What is the timestamp?
    1. Was the action active or interactive

### Event Viewer -  Disable Windows Firewal
0. 

### Event Viewer - Enable Powershell logging
0. 

### Event Viewer -  PSexec to another box
0. You will need TWO boxes for this activity
0. Open Powershell prompt
0. cd C:\_CSECTOOLS
0. .\psexec -u student -p student \\[remote hostname] New-LocalUser -Name "eviluser" -Password "password123"
0. Open Windows event viewer on remote machine and find:
    1. The logon event and the logon type
    1. What time did the user logon
    1. What command was run
    1. Find the event ID that created the service
0. .\psexec -u student -p student -r memes \\[remote hostname] New-LocalUser -Name "eviluser" -Password "password123"
    1. The logon event and the logon type
    1. What time did the user logon
    1. What command was run
    1. Find the event ID that created the service
    1. What is the service name?

## Scripting challenges
0. Create a Powershell script to parse the Windows Event logs for:
    1. When a service is disabled - include name and time
    1. When a process - include name, time, start user and binary location
    1. When 
0. Create a Powershell script to:
    1. Enable the Windows Firewall for ALL profiles
    1. Blocks all connections for inbound,outbound
    1. Allows inbound connections for all SMB ports
    1. Allows outbound connections for http, https, dns

## Red team challenge
 DO NOT USE/WRITE this script to attack/control machines you DO NOT own OR have written authorization

0. Create a script that log into each computer in the CSEC LAB to do:
    1. Get the process list
    1. Get the network services
    1. Get local users
    1. Run command "ipconfig"

# Resources/Sources
* https://social.technet.microsoft.com/Forums/Lync/en-US/ff70e069-5453-4250-b5c7-8d52ce558ce2/logon-types-in-windows-server?forum=winserverDS
* https://msdn.microsoft.com/en-us/library/windows/desktop/ms686005(v=vs.85).aspx