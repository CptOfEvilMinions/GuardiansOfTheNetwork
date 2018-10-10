# Week 5 - AuditD shootout
This week each group will load a box with an AuditD config. Each team will be attacked and the goal is to see what rules were the most effective.

## Outline
Add your AuditD rules to the auditd-outline.rules file provided

## Rules of shootout
0. AuditD is the logging agent of choice
0. AuditD config can only have 30 rules
    1. # is a comment and WILL NOT count towards the rule above
0. Logging platform will only allow 500MB of logs
0. Logs will be ROTATED when threshold is exceeded
0. Operating system will be Ubuntu/Debian
0. MUST USE outline provided

## Resources/Sources
* https://www.digitalocean.com/community/tutorials/how-to-write-custom-system-audit-rules-on-centos-7
* https://github.com/bfuzzy/auditd-attack/blob/master/attack_map.png
* https://github.com/bfuzzy/auditd-attack/blob/master/auditd-attack.rules
* https://gist.github.com/Neo23x0/9fe88c0c5979e017a389b90fd19ddfee
* https://github.com/GovReady/govready/blob/master/templates/audit.rules-rhel64_x86_64
* https://linux.die.net/man/8/auditctl
* https://security.blogoverflow.com/2013/01/a-brief-introduction-to-auditd/