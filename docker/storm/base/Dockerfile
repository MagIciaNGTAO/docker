FROM fitbur/base

MAINTAINER Sharmarke Aden, saden1@gmail.com

ENV _VERSION 0.9.1
ENV _FILE apache-storm-$_VERSION-incubating.zip
ENV _HOME /opt/apache-storm-$_VERSION-incubating

RUN apt-get install -y supervisor
RUN wget http://apache.mirrors.lucidnetworks.net/incubator/storm/apache-storm-$_VERSION-incubating/$_FILE -O /tmp/$_FILE
RUN unzip -o /tmp/$_FILE -d /opt
RUN rm /tmp/$_FILE
RUN ln -sfn $_HOME /opt/storm 
RUN ln -s $_HOME/bin/storm /usr/bin/storm

#RUN groupadd storm; useradd --gid storm --home-dir /home/storm --create-home --shell /bin/bash storm; chown -R storm:storm $_HOME; mkdir /var/log/storm ; chown -R storm:storm /var/log/storm
#RUN ln -s $_HOME/bin/storm /usr/bin/storm  

ADD storm.yaml $_HOME/conf/storm.yaml
ADD cluster.xml $_HOME/logback/cluster.xml
ADD storm-start.sh $_HOME/storm-start.sh
ADD etc/supervisor /etc/supervisor

RUN chmod a+x $_HOME/storm-start.sh
RUN chown -R fitbur:fitbur $_HOME

CMD ["/opt/storm/storm-start.sh"]

