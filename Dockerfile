FROM ubuntu:16.04

MAINTAINER NguyenNgoc <nguyenngoc.hust.97@gmail.com>

RUN DEBIAN_FRONTEND=noninteractive

RUN apt-get update

#Install nginx
RUN apt-get install -y nginx

#Install mysql
RUN echo "mysql-server mysql-server/root_password password root" | debconf-set-selections \
    && echo "mysql-server mysql-server/root_password_again password root" | debconf-set-selections \
    && apt-get install -y mysql-server

WORKDIR /docker_demo

COPY start.sh /docker_demo

RUN chmod a+x /docker_demo/*

ENTRYPOINT ["/docker_demo/start.sh"]

EXPOSE 80
