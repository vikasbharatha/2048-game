FROM ubuntu:22.04

RUN apt-get update

RUN apt-get install -y nginx zip curl

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

RUN curl -o /var/www/html/master.zip -L https://codeload.github.com/gabrielecirulli/2048/zip/master \
    && unzip /var/www/html/master.zip -d /var/www/html/ \
    && mv /var/www/html/2048-master/* /var/www/html/ \
    && rm -rf /var/www/html/2048-master /var/www/html/master.zip

EXPOSE 80

CMD ["/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf"]
