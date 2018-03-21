# Caldera the automated cyber adversary emulation system

## Deploy Caldera server
0. sudo apt install whois
0. mkpasswd --method=SHA-512
    1. Enter a password
0. Copy the output
0. vim hosts and set "[caldera]"
0. mv group_vars/all.example group_vars/all
0. vim group_vars and set:
    1. base_domain
    1. caldera_hostname
    1. timezone
    1. second_user
    1. second_pass to the output from mkpasswd
0. ansible-playbook -i hosts deploy_caldera.yml -u [username]

## Deploy Caldera agent
Caldera ONLY supports Windows clients for this application. Additionally this agent can only be used in the CSEC lab!!!

### Reset docker image on server
0. Login into server: ssh [username from cred sheet]@caldera.hackinglab.beer
    1. Use password from cred sheet
0. docker restart caldera
0. Logout

### Setup host for Caldera agent
0. On a CSEC lab host machine open a Powershell prompt as Administrator
0. Run `powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((new-object net.webclient).DownloadString('https://raw.githubusercontent.com/ansible/ansible/devel/examples/scripts/ConfigureRemotingForAnsible.ps1'))"`
0. vim hosts and set "[win_agents]"
0. mv groups_vars/windows.example groups_vars/windows
0. vim groups_vars/windows and set:
    1. ansible_user
    1. ansible_password
0. ansible-playbook -i hosts deploy_win_agents.yml 

## Create Caldera operation
### Creating an adversary
0. Select “Threat” then “Create adversary”
    1. Enter “test_adversary” as the name
    1. Select different adversary tactics from the steps drop down menu
        2. get_computers
        2. get_domain
        2. get_local_profiles
    1. Select “http” for exfil method
    1. Leave exfil address as default
    1. Enter “8888” for exfil port
    1. Select “Submit”

### Creating a network
0. Select “Networks” then “Create network”
    1. Enter “test_network” for name
    1. If you connected to a domain select the domain but this computer is NOT part of a domain
    1. Select the hosts you want to participate in the simulation
    1. Select “Submit”

### Creating an operation
0. Select “Operations” then “Create operation” 
    1. Enter “test_op” for name
    1. Select “test_adversay” for adversary
    1. Select “test_network” for network
    1. Select a starting host
        2. I only have one host for this demo
    1. Select “bootstrap rat” for start method
    1. Leave start path blank
    1. Select “active user” as the starting user
    1. Enter “explorer.exe” for parent process
    1. UNcheck “Auto-cleanup”
        2. I want to leave the artifacts behind for future posts
    1. Enter a desired command delay
    1. Enter a desired jitter
    1. Select “Submit”

# Supported OSes
* Ubuntu Server 16.04 64-bit
* Windows 10 64-bit

# Resources/Sources
* https://holdmybeersecurity.com/2018/01/13/install-setup-mitre-caldera-the-automated-cyber-adversary-emulation-system/
* https://github.com/mitre/caldera
* https://caldera.readthedocs.io/en/latest/