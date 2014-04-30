FROM fitbur/jdk

MAINTAINER Sharmarke Aden, saden1@gmail.com

ENV _NAME zookeeper
ENV _VERSION 3.4.6
ENV _FILE $_NAME-$_VERSION.tar.gz
ENV _HOME /opt/$_NAME-$_VERSION

RUN curl -L -o $_FILE http://archive.apache.org/dist/$_NAME/$_NAME-$_VERSION/$_FILE
RUN tar xzvf $_FILE -C /opt
RUN ln -sfn $_HOME /opt/$_NAME
RUN rm $_FILE

ADD resources $_HOME
ADD etc /etc

RUN find $_HOME -name "*.sh" | xargs chmod +x
RUN chown -R fitbur:fitbur $_HOME

EXPOSE 2181


