FROM fitbur/base

MAINTAINER Sharmarke Aden, saden1@gmail.com

ENV _VERSION 3.4.6
ENV _FILE zookeeper-$_VERSION.tar.gz
ENV _HOME /opt/zookeeper-$_VERSION

RUN wget http://apache.mirrors.lucidnetworks.net/zookeeper/zookeeper-$_VERSION/$_FILE -O /tmp/$_FILE
RUN tar xzvf /tmp/$_FILE -C /opt
RUN ln -sfn $_HOME /opt/zookeeper 

RUN mkdir -p /out

ADD zoo.cfg $_HOME/conf/zoo.cfg
ADD log4j.properties $_HOME/conf/log4j.properties

VOLUME [ "/out" ]

EXPOSE 2181

CMD ["/opt/zookeeper/bin/zkServer.sh", "start-foreground"]

