FROM fitbur/base

MAINTAINER Sharmarke Aden, saden1@gmail.com

ENV KAFKA_VERSION 0.8.1
ENV SCALA_VERSION 2.10
ENV VERSION $SCALA_VERSION-$KAFKA_VERSION
ENV KAFKA_FILE kafka_$VERSION.tgz
ENV KAFKA_HOME /opt/kafka_$VERSION

RUN wget http://apache.mirrors.lucidnetworks.net/kafka/$KAFKA_VERSION/$KAFKA_FILE -O /tmp/$KAFKA_FILE
RUN tar xzvf /tmp/$KAFKA_FILE -C /opt
RUN ln -sfn $KAFKA_HOME /opt/kafka 

RUN mkdir -p /out

ADD server.properties $KAFKA_HOME/config/server.properties
ADD kafka-start.sh $KAFKA_HOME/kafka-start.sh

ENV JMX_PORT 7203

VOLUME [ "/out" ]

# primary
EXPOSE 9092
# jmx
EXPOSE 7203

CMD ["/opt/kafka/kafka-start.sh"]
