# Graylog incident response

# Graylog presentation
Presentation: https://docs.google.com/presentation/d/1nhVRFJO2TOEhMyK0wOXa04I-pzLSS3PJNXCbuxFHlco/edit?usp=sharing

## I messed up
I set the filebeat config to collect `- /var/log/*.log` and not `- /var/log/*`. Whoops.
Any logs such as `syslog`, `wtmp`, and `btmp` didn't get logged.

## Linux
### Determing the initial compromise

### Determining attacker IP addr
0. Enter into grayog `"for ubuntu from *"`
    1. This entry can be found in auth.log
    1. Attacker IP
        2. 129.21.110.110 - timeframe

### Determine all the users that have been added
0. Enter into graylog `"new user: name=*"`
    1. This entry can be found in auth.log
    1. Users added:
        2. minon
        2. minion01
        2. redboi

### Determine malicious commands run as elevated user
0. Enter into graylog `"COMMAND="`
    1. This entry can be found in auth.log
    1. Malicious commands
        2. SSH keys 
            3. `COMMAND=/bin/cp /home/bitnami/.ssh/authorized_keys /root/.ssh/authorized_keys`
        2. anonly service
            3. `COMMAND=/bin/mv anomaly /bin/polkit`
            3. `COMMAND=/bin/chown root:root /bin/polkit`
            3. `COMMAND=/bin/chmod 4777 /bin/polkit`
            3. `COMMAND=/bin/systemctl start polkit`
            3. `COMMAND=/bin/systemctl enable polkit`
            3. `COMMAND=/usr/bin/vim /lib/systemd/system/polkit.service`
        2. Disabling IPtables
            3. `COMMAND=/bin/mv /sbin/iptables /sbin/notiptables`
        2. Malicious mounts
            3. `COMMAND=/bin/mount /dev/xvda1 /proc/X`
            3. `COMMAND=/bin/rm /bin/umount`

## Windows
### Malicious Powershell 
0. Enter into graylog `"powershell -noP -sta -w 1 -enc"`
    1. EventID 400 in Microsoft > Powershell
        2. Look at `HostApplication=`
    1. Use a website to decode the base64 string
    1. The decoded string contains:
        2. A user-agent
        2. Domain/IP addr the reverse shell is calling back too
        2. The URI it is requesting
        2. session key
    1. Enter `"/admin/get.php"` into graylog
        2. Your should see the contents of the Empire stager
        2.  

## Graylog
### Create slack notifications
#### Detect ssh logon

#### Detect malicious Powershell
0. Select “Alerts” at the top
0. Select “Manage Conditions”
0. Select “Windows Powershell Logging” stream
0. Select “Field content alert condition” for condition type
0. Select “Add alert condition”
    1. Enter “Powershell Empire alert” for title
    1. Enter “winlogbeat_event_data_ScriptBlockText” for field
    1. Enter ”powershell -noP -sta -w 1 -enc” for Value


#### Detect network type logon


# Resources/Sources
* https://www.first.org/resources/papers/conference2008/chuvakin-anton-slides.pdf
* https://digital-forensics.sans.org/blog/2010/03/10/unix-logging
* https://zeltser.com/security-incident-log-review-checklist/
* https://zeltser.com/media/docs/security-incident-log-review-checklist.pdf
