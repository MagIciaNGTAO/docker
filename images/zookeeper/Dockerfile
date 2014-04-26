FROM fitbur/jdk

MAINTAINER Sharmarke Aden, saden1@gmail.com

ENV _NAME zookeeper
ENV _VERSION 3.4.6
ENV _FILE $_NAME-$_VERSION.tar.gz
ENV _HOME /opt/$_NAME-$_VERSION

RUN wget http://archive.apache.org/dist/$_NAME/$_NAME-$_VERSION/$_FILE -O /tmp/$_FILE
RUN tar xzvf /tmp/$_FILE -C /opt
RUN ln -sfn $_HOME /opt/$_NAME
RUN rm /tmp/$_FILE

ADD resources $_HOME
ADD etc /etc

RUN find $_HOME -name "*.sh" | xargs chmod 755

VOLUME [ "/out" ]

EXPOSE 2181


