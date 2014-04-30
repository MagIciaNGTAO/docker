FROM fitbur/datastax-agent

MAINTAINER Sharmarke Aden, saden1@gmail.com

ENV _NAME cassandra
ENV _VERSION 2.0.6
ENV _FILE apache-$_NAME-$_VERSION-bin.tar.gz
ENV _HOME /opt/apache-$_NAME-$_VERSION
ENV _SERVICE /opt/$_NAME

RUN curl -L -o $_FILE http://archive.apache.org/dist/$_NAME/$_VERSION/$_FILE 
RUN tar xzvf $_FILE -C /opt
RUN ln -sfn $_HOME $_SERVICE
RUN rm $_FILE

ADD resources $_HOME
ADD etc /etc

RUN find $_HOME -name "*.sh" | xargs chmod +x
RUN chown -R fitbur:fitbur $_HOME

EXPOSE 7199 7000 7001 9160 9042

