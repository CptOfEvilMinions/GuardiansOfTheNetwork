#####################################################################
# Author: Ben Bornholm
# Date: 9-4-18
# Documentation: https://hub.docker.com/r/infoslack/dvwa/~/dockerfile/
#####################################################################
##################################################################
# Author: Ben Bornholm
# Date: 9-4-18
##################################################################
FROM infoslack/dvwa

# Copy database
COPY dvwa.sql /tmp/dvwa.sql

# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expose ports
# 80 - apache
# 3306 - MySQL
EXPOSE 80 
EXPOSE 3306

# Entrypoint script
CMD ["/entrypoint.sh"]