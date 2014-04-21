FROM fitbur/base

MAINTAINER Sharmarke Aden, saden1@gmail.com

ENV _VERSION 0.8.1
ENV SCALA_VERSION 2.10
ENV VERSION $SCALA_VERSION-$_VERSION
ENV _FILE _$VERSION.tgz
ENV _HOME /opt/_$VERSION
ENV JMX_PORT 7203

RUN wget http://apache.mirrors.lucidnetworks.net/kafka/$_VERSION/$_FILE -O /tmp/$_FILE
RUN tar xzvf /tmp/$_FILE -C /opt
RUN ln -sfn $_HOME /opt/kafka 

RUN mkdir -p /out

ADD server.properties $_HOME/config/server.properties
ADD kafka-start.sh $_HOME/kafka-start.sh



VOLUME [ "/out" ]

# primary
EXPOSE 9092 7203

CMD ["/opt/kafka/kafka-start.sh"]
