FROM fitbur/jdk

MAINTAINER Sharmarke Aden, saden1@gmail.com

ENV _NAME elasticsearch
ENV _VERSION 1.1.1
ENV _FILE $_NAME-$_VERSION.tar.gz
ENV _HOME /opt/$_NAME-$_VERSION
ENV _SERVICE /opt/$_NAME

RUN curl -L -o $_FILE https://download.elasticsearch.org/$_NAME/$_NAME/$_FILE 
RUN tar xzvf $_FILE -C /opt
RUN ln -sfn $_HOME $_SERVICE
RUN rm $_FILE

ADD resources $_HOME
ADD etc /etc

RUN find $_HOME -name "*.sh" | xargs chmod +x
RUN sed -i "s#CONFIG_HOME#$_HOME/config#g" $_HOME/config/elasticsearch.yml

RUN chown -R fitbur:fitbur $_HOME

RUN $_HOME/bin/plugin -install royrusso/elasticsearch-HQ

EXPOSE 9200
EXPOSE 9300

