FROM fitbur/jre

MAINTAINER Sharmarke Aden, saden1@gmail.com

ENV _NAME apacheds
ENV _VERSION 2.0.0-M16
ENV _FILE $_NAME-$_VERSION.tar.gz
ENV _HOME /opt/$_NAME-$_VERSION
ENV _SERVICE /opt/$_NAME

RUN curl -L -o $_FILE http://archive.apache.org/dist/directory/$_NAME/dist/$_VERSION/$_FILE
RUN tar xzvf $_FILE -C /opt
RUN ln -sfn $_HOME $_SERVICE
RUN rm $_FILE

ADD resources $_HOME
ADD etc /etc

RUN find $_HOME -name "*.sh" | xargs chmod +x
RUN chown -R fitbur:fitbur $_HOME

EXPOSE 10389 10636

