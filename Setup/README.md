# Setup Guardians box

## Install/Setup Docker swarm
0. mv group_vars/all.yml.example group_vars/all.yml
0. vim group_vars/all.yml and set:
    1. slack_channel
    1. slack_token
0. ansible-playbook -i hosts deploy_box.yml -u `<username>`

## Connect to Docker swarm
0. docker-machine create --driver generic --generic-ip-address=`<Docker swarm IP addr>` --generic-ssh-key ~/.ssh/id_rsa --generic-ssh-user=`<username>` guardians
0. eval $(docker-machine env guardians)

## Supported OSes
* Ubuntu Server 18.04 LTS 64-bit - Bionic Beaver

## Resources/Sources
* https://www.kevinkuszyk.com/2016/11/28/connect-your-docker-client-to-a-remote-docker-host/