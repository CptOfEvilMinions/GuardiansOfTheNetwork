#####################################################################
# Author: Ben Bornholm
# Date: 9-4-18
# Documentation: https://hub.docker.com/r/infoslack/dvwa/~/dockerfile/
#####################################################################
FROM infoslack/dvwa

# Set timezone
RUN echo "Europe/Stockholm" >/etc/timezone && dpkg-reconfigure -f noninteractive tzdata

# Install OpenSSH
RUN apt-get update -y && apt-get install openssh-server -y

# Copy suepervisor config for OpenSSH
COPY supervisord-openssh.conf /etc/supervisor/conf.d/supervisord-openssh.conf

# Copy database
COPY dvwa.sql /tmp/dvwa.sql

# Create user
RUN groupadd -r logs
RUN useradd -ms /bin/bash -g logs guardian
RUN echo 'guardian:Password123!' | chpasswd
RUN chgrp -R logs /var/log
RUN chmod -R g+r /var/log

# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expose ports
# 80 - apache
# 5000 - SSH
EXPOSE 80 
EXPOSE 5000

# Entrypoint script
CMD ["/entrypoint.sh"]