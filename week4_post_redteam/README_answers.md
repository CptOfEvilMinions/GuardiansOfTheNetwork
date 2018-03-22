# Post red team
Last week we simulated being an adversary by stepping through each stage of the attack life cycle with Powershell Empire. This week we will review the steps taken at each stage of our attack from perspective of a defender. The demo this week will touch on the Sysinternals toolkit, how to investigate the Windows event logs.

## Presentation
Post red team: https://docs.google.com/presentation/d/1gE5ScvxbL9my0a233l9EUIj0EHkpWrKp5XdH0swXvVA/edit?usp=sharing 

## Demo
### Sysinternals - Find Empire
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
0. What is the PID of the Powershell.exe?
    1. Will change
0. What is the PPID of the Powershell.exe?
    1. Should be the PPID of Powershell.exe
0. What is the start time of Explorer.exe?
    1. Will change
0. What is the path of the Powershell.exe?
    1. C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe
0. What is the command line of Explorer.exe?
    1. "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" -noP -sta -w 1 -enc [base64 encoded stager]"
0. Submit the process hash to VirusTotal. What is the result?
    1. 0/62 because Powershell isn't malcious :)

#### TCPView
0. What do the colors represent?
    1. Green - Initated connection
    1. Red - Terminated connection
0. What port does LSASS listen on?
    1. Port 49691
0. How can you correlate network connections to procsses in Process Explorer?
    1. By process ID(PID)
0. What port is Powershell connecting TO?
    1. Port 80
0. What IP address is Powershell connecting TO?
    1. 10.80.100.x
0. Why isn't Powershell keeping a persitent connection?
    1. It's an HTTP beacon

#### Autoruns
0. What does Autoruns list?
    1. The most comprehensive knowledge of auto-starting locations of any startup monitor, shows you what programs are configured to run during system bootup or login, and when you start various built-in Windows applications like Internet Explorer, Explorer and media players.
    1. Source: https://docs.microsoft.com/en-us/sysinternals/downloads/autoruns
0. What do the colors represent?
    1. Pink - Digital signature doesn't exist or doesn't match
    1. Yellow - Entry doesn't exist anymore 
0. Which tab(s) displays startup items
    1. Scheduled tasks
    1. Services
    1. Drivers
0. Which tab(s) displays that run at login 
    1. Winlogon
    1. Explorer
    1. Logon
0. What are the locations of three tabs in Autoruns?
    1. Winlogon - Registry: HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon
    1. Drivers - File system:  C:\Windows\system32\drivers 
    1. Explorer - Registry: HKLM\Software\Classes\*\ShellEx	
0. What is the default name of Empire persistence mechanism?
    1. Updater
0. Where is the peristence mechanism located?
    1. HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run
0. What time was the persistence mechanism implanted?
    1. Will change

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

### Event Viewer
#### Stop service
0. 

#### Disable Windows Firewal
0. 

#### PSexec to remote box
0. You will need TWO boxes for this activity
0. Open Powershell prompt
0. cd C:\_CSECTOOLS
0. .\psexec \\[remote hostname] ipconfig
0. Open Windows event viewer on remote machine and find:
    1. PSExec creates a service on the remote host. Where are service events logged to in Windows Event Viewer?
        2. System core log
    1. What is the Event ID and description?
        2. EventID  - 7045
        2. Description - A service was installed on the system
    1. What is the service name and service account?
        2. Name - PSEXESVC
        2. Account - SYSTEM
    1. What user was used to logon?
        2. [HOSTNAME]\student
    1. What time did the user logon?
        2. Will change
    1. Where are logon events stored in Windows Event Viewer?
        2. Security
    1. What was the remote source IP and port?
        2. IP - will change
        2. Port - Will change
    1. What is the logon type? 
        2. Type 3 - Network logon
    1. What command was run?
        2. We don't have proper logging to know the commands run :/

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
        2. Name - memes
        2. Account - LocalSystem
    1. What user was used to logon?
        2. [HOSTNAME]\student
    1. What time did the user logon?
        2. Will change
    1. What was the remote source IP and port?
        2. IP - will change
        2. Port - Will change
    1. What is the logon type? 
        2. Type 3 - Network logon
    1. Where are the Powershell logs located?
        2. Applications and Services Logs > Microsoft > Windows > Powershell > Operational
    1. What comamnd was run?
        2. Command run above

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