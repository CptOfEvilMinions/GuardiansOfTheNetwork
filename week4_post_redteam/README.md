# Post red team
Last week we simulated being an adversary by stepping through each stage of the attack life cycle with Powershell Empire. This week we will review the steps taken at each stage of our attack from perspective of a defender. The demo this week will touch on the Sysinternals toolkit, how to investigate the Windows event logs.

## Presentation
Post red team: https://docs.google.com/presentation/d/1gE5ScvxbL9my0a233l9EUIj0EHkpWrKp5XdH0swXvVA/edit?usp=sharing 

## Demo
### Sysinternals - Find Empire
#### Process Explorer
0. What do the colors represent?
0. What is the PID of Explorer.exe?
0. What is the PPID of Explorer.exe?
0. What is the start time of Explorer.exe?
0. What is the path of the Explorer.exe?
0. What is the command line of Explorer.exe?
0. How do you verify Explorer.exe with VirusTotal?
0. Discover how to display network connections for Explorer.exe.
0. What is the PID of the Powershell.exe?
0. What is the PPID of the Powershell.exe?
0. What is the start time of Explorer.exe?
0. What is the path of the Powershell.exe?
0. What is the command line of Explorer.exe?
0. Submit the process hash to VirusTotal. What is the result?

#### TCPView
0. What do the colors represent?
0. What port does LSASS listen on?
0. How can you correlate network connections to procsses in Process Explorer?
0. What port is Powershell connecting TO?
0. What IP address is Powershell connecting TO?
0. Why isn't Powershell keeping a persitent connection?

#### Autoruns
0. What does Autoruns list?
0. What do the colors represent?
0. Which tab(s) displays startup items
0. Which tab(s) displays that run at login 
0. What are the locations of three tabs in Autoruns?
0. What is the default name of Empire persistence mechanism?
0. Where is the peristence mechanism located?
0. What time was the persistence mechanism implanted?

### Windows core elements 
0. Service accounts:
    1. The three service accounts on Windows?
    1. Give an example of a service/program that will use each service account?
0. Logon types:
    1. Difference between interactive and non-interactive logon - example of both
    1. What are the ten logon types?

### Windows Event Viewer
0. Windows Event Viewer core logs
    1. What are the three core event logs?
    1. What is an example log for each core event log?
    1. Source: Book - Incident Response and Computer Forensics 3rd edition
0. What is the Windows Event ID(EID) and description for: - Windows 10
    1. Successful Logon?
    1. Failed logon? 
    1. User account created?
    1. Service creation?
    1. Process creation?
    1. Password change?

### Event Viewer
#### Stop service
0. TO DO

#### Disable Windows Firewal
0. TO DO

#### PSexec to remote box
0. You will need TWO boxes for this activity
0. Open Powershell prompt
0. cd C:\_CSECTOOLS
0. .\psexec \\[remote hostname] ipconfig
0. Open Windows event viewer on remote machine and find:
    1. PSExec creates a service on the remote host. Where are service events logged to in Windows Event Viewer?
    1. What is the Event ID and description?
    1. What is the service name and service account?
    1. What user was used to logon?
    1. What time did the user logon?
    1. Where are logon events stored in Windows Event Viewer?
    1. What was the remote source IP and port?
    1. What is the logon type? 
    1. What command was run?
   
#### PSexec with Powershell logging
##### Enable Powershell logging
0. On the remote machine
0. Open a run prompt and enter "gpedit.msc"
0. Expand Computer Configuration > Administrative Templates > Windows Components > Windows Powershell
0. Enable "Turn on Powershell Script Block Logging"
    1. This trick is a gift from red team

##### PSexec to remote box
0. .\psexec -r memes \\[remote hostname] powershell
0. Run "net user /add eviluser password123"
    1. What is the service name and service account?
    1. What user was used to logon?
    1. What time did the user logon?
    1. What was the remote source IP and port?
    1. What is the logon type? 
    1. Where are the Powershell logs located?
    1. What comamnd was run?
   
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