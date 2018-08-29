# Becoming the adversary
This week we covered the attack life cycle to gain an understanding of adversaries. The demo walked through how to become the adversary and walk through each stage of the attack life cycle.

## Disclaimer
The information contained in this presentation/demo is for educational purposes ONLY! RC3 nor its members hold any responsibility for any misuse of the information provided in any slides, discussions, activities, or exercises.

## Presentation
Becoming the adversary: https://docs.google.com/presentation/d/1r7gffW9kZ_mkHTJArXjMgpshJ1WK_OzCYIdM5Tr3i4c/edit?usp=sharing

## Demo
0. Create malicious stager for Microsoft Word document
0. Send malicious Word document to target
0. Target open the file and accept security warning
0. Plant persistence
0. Escalate privileges locally on the box
0. Internal network recon with reverse dns
0. Dump credentials for user
0. Utilize Windows service to move laterally
0. Plany persistence
0. Complete mission


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

# Resources/Sources
* Blog: https://www.powershellempire.com/
* Github: https://github.com/EmpireProject/Empire
* YouTube: https://www.youtube.com/watch?v=aDeJBe6eqps
* Blog: https://enigma0x3.net/2015/08/26/empire-tips-and-tricks/
* Blog: https://www.blackhillsinfosec.com/empire-resource-files-auto-runs-docx