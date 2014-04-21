FROM fitbur/base

MAINTAINER Sharmarke Aden, saden1@gmail.com

ENV _VERSION 2.0.6
ENV _FILE apache-cassandra-$_VERSION-bin.tar.gz
ENV _HOME /opt/apache-cassandra-$_VERSION
ENV _SERVICE /opt/cassandra

RUN mkdir -p /out

# Get $_VERSION  of Cassandra
RUN wget http://apache.mirrors.lucidnetworks.net/cassandra/$_VERSION/$_FILE -O /tmp/$_FILE

RUN tar xzvf /tmp/$_FILE -C /opt
RUN ln -sfn $_HOME $_SERVICE
RUN rm /tmp/$_FILE

ADD cassandra.yaml $_HOME/conf/cassandra.yaml
ADD log4j-server.properties $_HOME/conf/log4j-server.properties
ADD cassandra-topology.properties $_HOME/conf/cassandra-topology.properties
ADD cassandra-start.sh $_HOME/cassandra-start.sh

RUN chmod a+x $_HOME/cassandra-start.sh

VOLUME [ "/out" ]

EXPOSE 7199 7000 7001 9160 9042

CMD ["/opt/cassandra/cassandra-start.sh"]
