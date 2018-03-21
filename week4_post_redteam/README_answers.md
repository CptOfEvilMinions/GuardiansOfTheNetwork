# Post red team
Last week we simulated being an adversary by stepping through each stage of the attack life cycle with Powershell Empire. This week we will review the steps taken at each stage of our attack from perspective of a defender. The demo this week will touch on the Sysinternals toolkit, how to investigate the Windows event logs, and how to use a log aggregating service like Graylog.

## Presentation
Post red team: https://docs.google.com/presentation/d/1gE5ScvxbL9my0a233l9EUIj0EHkpWrKp5XdH0swXvVA/edit?usp=sharing 

## Demo
### Windows core elements 
0. Service accounts:
    1. The three service accounts on Windows?
        2. Local System
        2. Network Service
        2. Local Service
        2. Source: https://msdn.microsoft.com/en-us/library/windows/desktop/ms686005(v=vs.85).aspx 
    1. Give an example of a service/program that will use each service account?
        2. Local System - Windows Update
        2. Network Service - Fax
        2. Local Service - Web client 
        2. Source: Looked at the list of services on Windows - Run > services.msc
0. Logon types:
    1. Difference between interactive and non-interactive logon - example of both
        2. Interactive - User logged on via the console(keyboard and mouse)
        2. Non-interactive  - Network logon such as Remote Desktop
    1. What are the ten logon types?
        2. Interactive
        2. Network
        2. Batch
        2. Service
        2. Proxy
        2. Unlock
        2. NetworkCleartext
        2. NewCredentials
        2. RemoteInteractive
        2. CacheInteractive 
    1. Source: Book - Incident Response and Computer Forensics 3rd edition

### Windows Event Viewer
0. Windows Event Viewer core logs
    1. What are the three core event logs?
        2. Application - Activites related to user programs and commericial off the shelf applications
        2. System - Core operating system operations
        2. Security - Windows authentication and security processes
    1. What is an example log for each core event log?
        2. Application - An application crash or anti-virus logs
        2. System - Service changes - start ---> stop
        2. Security - User logon
    1. Source: Book - Incident Response and Computer Forensics 3rd edition
0. What is the Windows Event ID(EID) and description for: - Windows 10
    1. Successful Logon?
        2. 4624
    1. Failed logon? 
        2. 4625
    1. User account created?
        2. 4720
    1. Service creation?
        2. 7045
    1. Process creation?
        2. 4688
    1. Password change?
        2. 4723
    1. Main source: Google lol
    1. Secondary source: https://isc.sans.edu/forums/diary/Windows+Events+log+for+IRForensics+Part+1/21493

### Sysinternals
#### Process Explorer
0. What do the colors represent?
    1. Bright green - new process
    1. Bright red - terminated process
    1. Light blue - Process running as you(user your logged in as)
    1. Light pink - Windows service
    1. Dark gray - Suspended process
    1. Bright blue - Application/process from Windows store
    1. Purple - Packed process - indicator of malware 
0. What is the PID of Explorer.exe?
    1. Will change
0. What is the PPID of Explorer.exe?
    1. Will change
0. What is the start time of Explorer.exe?
    1. Will change
0. What is the path of the Explorer.exe?
    1. C:\Windows\explorer.exe
0. What is the command line of Explorer.exe?
    1. C:\Windows\Explorer.EXE
0. How do you verify Explorer.exe with VirusTotal?
    1. Select "verify"
0. Discover how to display network connections for Explorer.exe.
    1. Select "TCP/IP" tab

#### TCPView
0. What do the colors represent?
    1. Green - Initated connection
    1. Red - Terminated connection
0. What port does LSASS listen on?
    1. Port 49691
0. How can you correlate network connections to procsses in Process Explorer?
    1. By process ID(PID)

#### Autoruns
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

## Red team challenges
DO NOT USE/WRITE this script(s) to attack/control machines you DO NOT own OR have written authorization to do so!!!

0. Create a script that will log into each computer in the CSEC LAB and retrieve:
    1. Get the process list
    1. Get the network services
    1. Get local users
    1. Run command "ipconfig"
0. Create a script that will log into each computer in the CSEC lab and detonate a Powershell Empire stager

# Resources/Sources
* https://social.technet.microsoft.com/Forums/Lync/en-US/ff70e069-5453-4250-b5c7-8d52ce558ce2/logon-types-in-windows-server?forum=winserverDS
* https://msdn.microsoft.com/en-us/library/windows/desktop/ms686005(v=vs.85).aspx