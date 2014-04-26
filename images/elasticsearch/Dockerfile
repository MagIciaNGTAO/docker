FROM fitbur/jdk

MAINTAINER Sharmarke Aden, saden1@gmail.com

ENV _NAME elasticsearch
ENV _VERSION 1.1.1
ENV _FILE $_NAME-$_VERSION.tar.gz
ENV _HOME /opt/$_NAME-$_VERSION

RUN wget https://download.elasticsearch.org/$_NAME/$_NAME/$_FILE -O /tmp/$_FILE
RUN tar xzvf /tmp/$_FILE -C /opt
RUN ln -sfn $_HOME /opt/$_NAME
RUN rm /tmp/$_FILE

ADD resources $_HOME
ADD etc /etc

RUN find $_HOME -name "*.sh" | xargs chmod 755
RUN sed -i "s#HOME_CONFIG#$_HOME/config#g" $_HOME/config/$_NAME.yml

VOLUME [ "/out" ]

EXPOSE 9200
EXPOSE 9300

