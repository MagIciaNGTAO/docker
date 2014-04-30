FROM ubuntu:14.04

MAINTAINER Sharmarke Aden, saden1@gmail.com
ENV _VERSION 14.04
ENV _OUT /out

# Set default system settings
RUN locale-gen en_US en_US.UTF-8
RUN echo "debconf debconf/frontend select Teletype" | debconf-set-selections

# Add Universe repository, update and upgrade the system
RUN echo "deb http://archive.ubuntu.com/ubuntu trusty main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get dist-upgrade -y

# Install Tools
RUN apt-get install -y curl wget nano unzip openssh-server supervisor sysstat
RUN apt-get -y clean
RUN apt-get -y autoremove
RUN apt-get autoremove

# Add System Configurations
ADD etc /etc
ADD usr /usr

RUN chmod a+x /usr/bin/setenv

# Create default privileged user (fitbur)
RUN useradd -U -m -G sudo -d /home/fitbur -s /bin/bash fitbur
RUN echo "fitbur:fitbur" | chpasswd

# Set  root password
RUN echo "root:fitbur" | chpasswd

# Create directories
RUN mkdir -p /out
RUN mkdir -p /var/run/sshd

# TODO: from a security standpoint is this wise?
# This is OK for dev but not for prod.
RUN chown -R fitbur:fitbur $_OUT

VOLUME ["/out"]

# Expose SSH port
EXPOSE 22

# Run supervised services
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]

