# Week 1 - Post incindent: Lessons learned
This week we are going to investigate the 2014 Target breach. In the "resources/sources" section there are multiple breach reports that we will review as a lessons learned.

## Presentation
Post incident response presentation: https://docs.google.com/presentation/d/1rkPmLuZjM7NS0jxQ5nstZJc2Z_n7M5M5q0MRbVg_ZMA/edit?usp=sharing

## Setup demo
### Init demo
0. `echo <password> | sudo docker secret create guardian-pass -`
0. docker-compose up -d

## Scripting challenge


## Red team challenge
The Docker stack for this week has Bro installed on it with the PII detector plugin. Create a script to exfiltrate the credit-card.dump file from the box to a remote machine WITHOUT being caught by BRO. 

Your script script:
* CANNOT use pre-existing encryption like AES BUT you can make your own
* CANNOT use pre-existing obfuscation algorithms like Base64 BUT you can make your own
* must use HTTP
* must use Python built-in modules and the module `requests`
* Turning up the heat: Create an HTTP covert channel to exfiltrate the data without using the payload section of HTTP.
    * Ex: Appending data to request URL


## Resources/Sources
* https://arxiv.org/pdf/1701.04940.pdf
* https://www.sans.org/reading-room/whitepapers/casestudies/case-study-critical-controls-prevented-target-breach-35412 
* https://www.sans.org/reading-room/whitepapers/incident/incident-handlers-handbook-33901
* https://krebsonsecurity.com/wp-content/uploads/2014/01/Inside-a-Targeted-Point-of-Sale-Data-Breach.pdf