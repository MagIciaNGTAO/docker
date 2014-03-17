FROM fitbur/base

MAINTAINER Sharmarke Aden, saden1@gmail.com

ENV ZK_VERSION 3.4.6
ENV ZK_FILE zookeeper-$ZK_VERSION.tar.gz
ENV ZK_HOME /opt/zookeeper-$ZK_VERSION

RUN wget http://apache.mirrors.lucidnetworks.net/zookeeper/zookeeper-$ZK_VERSION/$ZK_FILE -O /tmp/$ZK_FILE
RUN tar xzvf /tmp/$ZK_FILE -C /opt
RUN ln -sfn $ZK_HOME /opt/zookeeper 

RUN mkdir -p /out

ADD zoo.cfg $ZK_HOME/conf/zoo.cfg
ADD log4j.properties $ZK_HOME/conf/log4j.properties

VOLUME [ "/out" ]

EXPOSE 2181

CMD ["/opt/zookeeper/bin/zkServer.sh", "start-foreground"]

