FROM centos:latest
MAINTAINER cpbarik.mca@gmail.com
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum update -y

RUN yum install -y httpd \
  zip \
  unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page1/photoprowess.zip /var/www/html
WORKDIR /var/www/html
RUN unzip photoprowess.zip
RUN cp -rvf photoprowess/* .
RUN rm -rf photoprowess photoprowess.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
