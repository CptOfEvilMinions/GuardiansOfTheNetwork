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

# Supported OSes
* Ubuntu Server 16.04 64-bit

# Resources/Sources
* https://holdmybeersecurity.com/2018/01/13/install-setup-mitre-caldera-the-automated-cyber-adversary-emulation-system/
* https://github.com/mitre/caldera
* https://caldera.readthedocs.io/en/latest/