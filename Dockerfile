FROM ubuntu:latest
MAINTAINER b.shibabarik@gmail.com

RUN ["/bin/bash", "-c", "apt update && apt install -y httpd zip unzip"]
ADD https://www.free-css.com/assets/files/free-css-templates/download/page1/photoprowess.zip /var/www/html
WORKDIR /var/www/html
RUN unzip photoprowess.zip
RUN cp -rvf photoprowess/* .
RUN rm -rf photoprowess photoprowess.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
