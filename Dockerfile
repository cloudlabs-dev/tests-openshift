FROM fedora

MAINTAINER Leonardo Costa <lcosta@cloudlabs.com.br>

RUN dnf install httpd php -y
RUN sed -i 's/Listen 80/Listen 8080/' /etc/httpd/conf/httpd.conf 
RUN chmod -R a+rwx /run/httpd /etc/httpd/logs
RUN echo "<?php print $_SERVER[SERVER_ADDR]" > /var/www/html/index.php 

EXPOSE 8080

CMD /bin/bash -c 'echo Starting Microservice... ; \
    /usr/sbin/httpd -DFOREGROUND || echo Apache start failed: $?'
