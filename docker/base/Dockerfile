FROM ubuntu:12.04

MAINTAINER Sharmarke Aden, saden1@gmail.com

# Setup software and repositories
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update

# Install core softwware tools
RUN apt-get install -y curl wget nano git build-essential software-properties-common python-software-properties
RUN apt-get dist-upgrade

# Set the local
RUN locale-gen en_US en_US.UTF-8

# Install Java
RUN add-apt-repository -y ppa:webupd8team/java 
RUN apt-get update
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get -y install oracle-java8-installer 
RUN apt-get -y clean
RUN update-java-alternatives -s java-8-oracle 
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
