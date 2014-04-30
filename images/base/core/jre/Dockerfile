FROM fitbur/ubuntu

MAINTAINER Sharmarke Aden, saden1@gmail.com
ENV _VERSION 7u51

# Install OpenJDK JRE
RUN apt-get -y install openjdk-7-jre-headless

# Cleanup
RUN apt-get -y clean
RUN apt-get -y autoremove

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64

