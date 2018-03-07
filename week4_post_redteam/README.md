# Post red team
Last week we simulated being a red team adversary by going through each stage of the attack life cycle. This we will review the steps taken at each stage of our attack from perspective of a blue teamer. We touch on the Sysinternals toolkit, how to read Windows event logs, and using a log aggregating service like Gralog.

## Presentation
Post red team: https://docs.google.com/presentation/d/1gE5ScvxbL9my0a233l9EUIj0EHkpWrKp5XdH0swXvVA/edit?usp=sharing 

## Cred sheet
Creds: https://docs.google.com/document/d/1b9bcy3_5CRM_pr996KVKsfEDnir8TkMPG2ewzTlPX38/edit?usp=sharing

## Demo setup
### Setup Graylog
0. mv group_vars/all.example group_vars/all
0. vim group_vars/all and set
    1. base_domain
    1. graylog_admin_password
0. vim hosts and set [graylog]
0. ansible-playbook -i hosts deploy_graylog.yml -u [user]

### Setup Windows agents
0. vim hosts and set [win_agents]
0. vim group_vars/win_agents and set:
    1. ansible_username
    1. ansible_password
0. ansible-playbook -i hosts deploy_win_agents.yml

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
0. What is the PID of Explorer.exe?
0. What is the PPID of Explorer.exe?
0. What is the start time of Explorer.exe?
0. What is the path of the Explorer.exe?
0. What is the command line of Explorer.exe?
0. How do you verify Explorer.exe with VirusTotal?
0. Discover how to display network connections for Explorer.exe.

### Sysinternals - TCPView
0. What do the colors represent?
0. What port does LSASS listen on?
0. How can you correlate network connections to procsses in Process Explorer?

### Sysinternals - Autoruns
0. What does Autoruns list?
0. Which tab displays startup items
0. Which tab displays that run at login 
0. What are the locations of three tabs in Autoruns?
    1. For example, Autoruns shows startup items which is located in the Registry. Provide the Registry path.

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
0. .\psexec -u student -p student \\[remote hostname] New-LocalUser ipconfig
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

### Graylog - Finding Powershell stager
0. Browse to https://graylog.hackinglab.beer
    1. Username: [Graylog username - cred sheet above] 
    1. Password: [Graylog password - cred sheet above]
0. Select the search tab
0. Enter "[beginning string of powershell stager]" and hit enter
0. Sift through data and find entry for:
    1. What is the Powershell stager command?
    1. What time did the stager detonate?
    1. What is the Powershell PID?
    1. What is the hostname of the machine this stager was detonated on?
    1. What is the document ID?
    1. Is this document the first occurence of this stager being detonated?
        2. If not, go find it!!! 
        
### Graylog - Analyzing attack            
0. Decode the base64 Powershell Empire stager to get:
    1. What is the user-agent being used?
    1. What is the IP addr of the teamserver?
    1. What is the cookie session ID?
    1. What is the URL the stager is calling back too?
0. Search for "[URL for stager]"
0. Find document that contains the Powershell Empire agent(NOT stager) code
    1. What are three built-in functions of the agent?

## Scripting challenges
0. Create a Powershell script to parse the Windows Event logs for:
    1. When a service is disabled - include name and time
    1. When a process - include name, time, start user and binary location
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