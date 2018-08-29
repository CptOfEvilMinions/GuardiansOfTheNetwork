# Linux competition incident response

## Presentations
* Linux incident response: https://docs.google.com/presentation/d/1rWHSuVljPgzHK-HT9KRf9SMNth1KpS4oNrUo_ZRncW0/edit?usp=sharing
* Linux Blue: https://docs.google.com/presentation/d/1iEsR8S63TmF7WsjWWLgxJoUvCTDCNe0dDyj2kY7-fNA/edit?usp=sharing

## Creds
Creds: https://docs.google.com/document/d/1jBzVjC18qCV-LwMNq_5j6mcbAUCabOxcQQCezldXGJ8/edit?usp=sharing

## Pre demo seutp
0. Spin up Wordpress box on EC2

## Demo setup
0. mv group_vars/all.example group_vars/all
0. vim group_vars/all and set
    1. Slack
    1. user
0. vim hosts and set "[linux_agents]"
0. ansible-playbook -i hosts deploy_demo.sh

## Rules/Demo
0. SSH, HTTP/S must be accessible to the entire world
0. DO NOT remove MY SSH key from ubuntu/.ssh/authorized_keys
0. DO NOT TOUCH the ubuntu account!!!
0. Keep your wordpress site alive
    1. Must be accessible by ALL USERS
    1. change wordpress `user` password
    1. change mysql `root` password
0. DO NOT `iptable -A INPUT .... -s 129.21.0.0/16 .... -j DROP`
0. DO NOT change default pqull password

# Resource/Sources
* https://docs.bitnami.com/aws/faq/starting-bitnami-aws/find_credentials/
