FROM fitbur/jdk

MAINTAINER Sharmarke Aden, saden1@gmail.com

ENV _NAME kafka
ENV _VERSION 0.8.1
ENV _SCALA_VERSION 2.10
ENV _FILE ${_NAME}_${_SCALA_VERSION}-$_VERSION.tgz
ENV _HOME /opt/${_NAME}_${_SCALA_VERSION}-$_VERSION
ENV JMX_PORT 7203
ENV _SERVICE /opt/$_NAME

RUN curl -L -o $_FILE http://archive.apache.org/dist/$_NAME/$_VERSION/$_FILE
RUN tar xzvf $_FILE -C /opt
RUN ln -sfn $_HOME $_SERVICE
RUN rm $_FILE

ADD resources $_HOME
ADD etc /etc

RUN find $_HOME -name "*.sh" | xargs chmod +x
RUN chown -R fitbur:fitbur $_HOME

EXPOSE 9092 7203

