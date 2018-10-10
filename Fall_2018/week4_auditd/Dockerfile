#####################################################################
# Author: Ben Bornholm
# Date: 9-4-18
# Documentation: https://hub.docker.com/r/infoslack/dvwa/~/dockerfile/
#####################################################################
FROM infoslack/dvwa

# Set timezone
RUN echo "Europe/Stockholm" >/etc/timezone && dpkg-reconfigure -f noninteractive tzdata

# Install/Setup Filebeat
RUN wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
RUN apt-get update -y && apt-get install apt-transport-https -y
RUN echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-6.x.list
RUN apt-get update -y && apt-get install filebeat -y
COPY conf/filebeat.yml /etc/filebeat/filebeat.yml

# Install OpenSSH
RUN apt-get update -y && apt-get install openssh-server -y

# Copy suepervisor config for OpenSSH
COPY conf/supervisord-openssh.conf /etc/supervisor/conf.d/supervisord-openssh.conf

# Copy database
COPY conf/dvwa.sql /tmp/dvwa.sql

# Create user
RUN groupadd -r logs
RUN useradd -ms /bin/bash -g logs guardian
RUN echo 'guardian:Password123!' | chpasswd
RUN chgrp -R logs /var/log
RUN chmod -R g+r /var/log

# Copy entrypoint script
COPY conf/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expose ports
# 80 - apache
# 5000 - SSH
EXPOSE 80 
EXPOSE 5000

# Entrypoint script
CMD ["/entrypoint.sh"]