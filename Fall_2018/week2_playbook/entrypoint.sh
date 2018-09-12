#!/bin/bash

cat /run/secrets/guardian-pass
########################### Create group and user ###########################
if id "guardian" >/dev/null 2>&1; then
    echo "user exists"
else
    echo "user does not exist"

    groupadd -r logs
    useradd -ms /bin/bash -g logs guardian

    # Grab contents of file and set variable
    
    pass1=`cat /run/secrets/guardian-pass | tr -d '\n'`

    # Set password for user
    echo "guardian:$pass1" | chpasswd

    # Set perms for Bro logs
    chgrp -R logs /var/log/bro
    chmod -R g+r /var/log/bro
fi

########################### SSHD ###########################
if [ ! -d /run/sshd ]
then
    mkdir /run/sshd
fi

########################### Set IPtables ###########################
# Get IP addr of SQUID via name lookup
squid=$(nslookup squid | grep Address | grep -v "127.0.0.1" | awk '{print $2}' )

# Set default policies to DROP
iptables -P INPUT DROP && iptables -P FORWARD DROP && iptables -P OUTPUT DROP

# Allow SSH
iptables -A INPUT -p tcp --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp --sport 22 -m state --state ESTABLISHED -j ACCEPT

# Allow HTTP out via proxy
iptables -A OUTPUT -p tcp -d $squid --match multiport --dports 3128 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp -s $squid --match multiport --sports 3128 -m state --state ESTABLISHED -j ACCEPT

# Allow DNS queries
iptables -A OUTPUT -p udp --dport 53 -j ACCEPT
iptables -A INPUT -p udp  --sport 53 -j ACCEPT

# Allow loopback
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

# Add squid to /etc/hosts
echo "$squid    squid" >> /etc/hosts

########################### Bro install ###########################
#exec /usr/bin/broctl install
#exec /usr/bin/broctl start

########################### Start supervisor ###########################
exec /usr/bin/supervisord -c /etc/supervisor.conf
