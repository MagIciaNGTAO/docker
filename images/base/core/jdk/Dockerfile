FROM fitbur/ubuntu

MAINTAINER Sharmarke Aden, saden1@gmail.com
ENV _VERSION 8u5

# Install core softwware tools
RUN apt-get install -y software-properties-common

# Install Java
# Add PPA for Java
RUN add-apt-repository -y ppa:webupd8team/java
RUN apt-get update
# Auto accept license
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
# Install the meta package that also sets JAVA_HOME and PATHs env variables
# Also remove the relic files left behind by the oracle installer
RUN apt-get -y install oracle-java8-set-default && rm -rf /var/cache/oracle-jdk8-installer
RUN update-java-alternatives -s java-8-oracle 

# Cleanup
RUN apt-get -y clean
RUN apt-get -y autoremove




