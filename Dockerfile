FROM ubuntu:16.04

MAINTAINER NguyenNgoc <nguyenngoc.hust.97@gmail.com>

RUN DEBIAN_FRONTEND=noninteractive

RUN apt-get update

RUN apt-get install -y nginx

WORKDIR /docker_demo

COPY start.sh /docker_demo

RUN chmod a+x /docker_demo/*

ENTRYPOINT ["/docker_demo/start.sh"]

EXPOSE 80