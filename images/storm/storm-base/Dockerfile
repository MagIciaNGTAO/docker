FROM fitbur/jdk

MAINTAINER Sharmarke Aden, saden1@gmail.com

ENV _NAME storm
ENV _VERSION 0.9.1
ENV _FILE apache-$_NAME-$_VERSION-incubating.zip
ENV _HOME /opt/apache-$_NAME-$_VERSION-incubating

RUN curl -L -o $_FILE http://archive.apache.org/dist/incubator/$_NAME/apache-$_NAME-$_VERSION-incubating/$_FILE
RUN unzip -o $_FILE -d /opt
RUN rm $_FILE
RUN ln -sfn $_HOME /opt/$_NAME 
RUN ln -s $_HOME/bin/storm /usr/bin/storm

ADD resources $_HOME

RUN find $_HOME -name "*.sh" | xargs chmod +x
RUN chown -R fitbur:fitbur $_HOME

