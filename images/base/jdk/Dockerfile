FROM fitbur/common

MAINTAINER Sharmarke Aden, saden1@gmail.com
ENV _VERSION 8u5

# Install core softwware tools
RUN apt-get install -y software-properties-common

# Install Java
RUN add-apt-repository -y ppa:webupd8team/java
RUN apt-get update
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get -y install oracle-java8-installer 
RUN apt-get -y clean
RUN update-java-alternatives -s java-8-oracle 
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

