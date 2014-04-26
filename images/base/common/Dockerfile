FROM ubuntu:14.04

MAINTAINER Sharmarke Aden, saden1@gmail.com

# Set default system settings
RUN locale-gen en_US en_US.UTF-8
RUN echo "debconf debconf/frontend select Teletype" | debconf-set-selections

# Add Universe repository, update and upgrade the system
RUN echo "deb http://archive.ubuntu.com/ubuntu trusty main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get dist-upgrade -y

# Install Tools
RUN apt-get install -y curl wget nano unzip openssh-server supervisor

# Add System Configurations
ADD etc/supervisor /etc/supervisor
ADD etc/ssh /etc/ssh

# Create directories
RUN mkdir -p /out
RUN mkdir -p /var/run/sshd

# Create default system user
ENV _USER fitbur
ENV _HOME /home/$_USER
RUN useradd -U -m -G sudo -d $_HOME -s /bin/bash $_USER
RUN echo "$_USER:$_USER" | chpasswd

# Set  root password
RUN echo "root:fitbur" | chpasswd

# Expose SSH port
EXPOSE 22

# Run supervised services
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]
