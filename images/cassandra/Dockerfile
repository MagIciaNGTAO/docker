FROM fitbur/jdk

MAINTAINER Sharmarke Aden, saden1@gmail.com

ENV _NAME cassandra
ENV _VERSION 2.0.6
ENV _FILE apache-$_NAME-$_VERSION-bin.tar.gz
ENV _HOME /opt/apache-$_NAME-$_VERSION
ENV _SERVICE /opt/$_NAME

RUN wget http://archive.apache.org/dist/$_NAME/$_VERSION/$_FILE -O /tmp/$_FILE
RUN tar xzvf /tmp/$_FILE -C /opt
RUN ln -sfn $_HOME $_SERVICE
RUN rm /tmp/$_FILE

ADD resources $_HOME
ADD etc /etc

RUN find $_HOME -name "*.sh" | xargs chmod 755

VOLUME [ "/out" ]

EXPOSE 7199 7000 7001 9160 9042

