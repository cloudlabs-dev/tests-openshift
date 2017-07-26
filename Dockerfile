FROM fedora

MAINTAINER Leonardo Costa <lcosta@cloudlabs.com.br>

RUN dnf install httpd php -y

RUN echo "<?php print $_SERVER[SERVER_ADDR]" > /var/www/html/index.php 

EXPOSE 8080

ENTRYPOINT [“/usr/sbin/httpd”]
CMD [“-D”, “FOREGROUND”]
