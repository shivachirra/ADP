FROM nginx:alpine

MAINTAINER Shiva

# Custom website files
COPY www /usr/share/nginx/html

# Nginx configuration files
COPY conf/default.conf /etc/nginx/conf.d/default.conf
COPY conf/authnginx/htpasswd /etc/nginx/authnginx/htpasswd
RUN ["/bin/bash", "-c", "mkdir -p /var/www/myfirstpage/html"]
RUN ["/bin/bash", "-c", "mkdir -p /var/www/mysecondpage/html"]
RUN ["/bin/bash", "-c", "mkdir -p /var/www/mythirdpage/html"]
RUN ["/bin/bash", "-c", "sudo ln -s /etc/nginx/sites-available/myfirstpage.com /etc/nginx/sites-enabled/"]
RUN ["/bin/bash", "-c", "sudo ln -s /etc/nginx/sites-available/mysecondpage.com /etc/nginx/sites-enabled/"]
RUN ["/bin/bash", "-c", "sudo ln -s /etc/nginx/sites-available/mythirdpage.com /etc/nginx/sites-enabled/"]
