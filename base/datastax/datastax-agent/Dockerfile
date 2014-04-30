FROM fitbur/jre

MAINTAINER Sharmarke Aden, saden1@gmail.com

ENV _NAME datastax-agent
ENV _VERSION 4.1.2
ENV _FILE $_NAME-$_VERSION.tar.gz
ENV _HOME /opt/$_NAME-$_VERSION

RUN curl -L -o $_FILE  http://downloads.datastax.com/community/$_FILE
RUN tar xzvf $_FILE -C /opt
RUN ln -sfn $_HOME /opt/$_NAME
RUN rm $_FILE

ADD resources $_HOME
ADD etc /etc

RUN find $_HOME -name "*.sh" | xargs chmod 755
RUN chown -R fitbur:fitbur $_HOME

EXPOSE 7199 8012 61621


