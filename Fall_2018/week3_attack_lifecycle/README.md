# Week 3 - Attack Lifecycle
This week we are becoming the adversary. First, we will dicuss the Fireye Attack LifeCycle to understand the phases of an attacker. Next, we will do a red team demo with Powershell Empire.

## Presentation
Attack lifecycle: https://docs.google.com/presentation/d/11l3b0F55H2HESI7S8j1UHEmQtD266JH2LqDOfohmX0U/edit?usp=sharing


## Demo
0. Create malicious stager for Microsoft Word document
0. Send malicious Word document to target
0. Target open the file and accept security warning
0. Plant persistence
0. Escalate privileges locally on the box
0. Internal network recon with reverse dns
0. Dump credentials for user
0. Utilize PsExec to move laterally
0. Plant persistence
0. Complete mission

## Incident response challenge
Use a tool of your choice to detect phases of our attack.
Tools:
* OSquery
* Sysmon
* Windows Event Viewer
* Sysinternals

## Scripting challenges
Write a script in any language of your choosing to detect common methods of initial compromise and persistence on Windows.

0. Script should detect if the firewall is on/off
0. Script should detect malicious instances of Powershell.exe
    1. Hint "-enc [base64 string]" in starting command
0. Script should print scheduled tasks that were created in the last 24 hours
    1. Time interval can be a variable or something of your choosing.
0. Script should print items in the Winlogon location in the Windows Registry
0. Script should print items in the Autostart location in the Windows Registry
0. Script should print items in the Winlogon location in the Windows Registry
0. Get Windows DNS cache

## Red team challenge
Watch this video by Black Hills Infosec on how to automate Powershell Empire: https://www.blackhillsinfosec.com/empire-resource-files-auto-runs-docx/. 
Create a resource file(s) to do the actions below. DO NOT attack any machines you DO NOT OWN OR DO NOT HAVE AUTHORIZATION to attack.

0. Creates an HTTPS listener:
    1. Set beacon interval to 30 seconds
    1. Changes default profile
    1. Changes default user-agent
0. Autorun for agents:
    1. Takes a screenshot of desktop
    1. Deploys a keylogger
    1. Places a persistent mechanism

## Resources/Sources
* http://www.iacpcybercenter.org/resource-center/what-is-cyber-crime/cyber-attack-lifecycle/
* https://www.sans.org/summit-archives/file/summit-archive-1493841302.pdf
* https://link.springer.com/content/pdf/10.1007%2F978-1-4842-3870-7.pdf
* Blog: https://www.powershellempire.com/
* Github: https://github.com/EmpireProject/Empire
* YouTube: https://www.youtube.com/watch?v=aDeJBe6eqps
* Blog: https://enigma0x3.net/2015/08/26/empire-tips-and-tricks/
* Blog: https://www.blackhillsinfosec.com/empire-resource-files-auto-runs-docx
