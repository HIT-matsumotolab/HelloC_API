FROM phpmyadmin/phpmyadmin:latest

RUN apt-get update
RUN apt-get -y install locales-all

ENV PMA_HOST mysql
ENV PMA_USER root
ENV PMA_PASSWORD password
