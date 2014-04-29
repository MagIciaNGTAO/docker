FROM fitbur/jdk

MAINTAINER Sharmarke Aden, saden1@gmail.com

ENV _NAME opscenter
ENV _VERSION 4.1.2
ENV _FILE $_NAME-$_VERSION.tar.gz
ENV _HOME /opt/$_NAME-$_VERSION

RUN curl -L -o /tmp/$_FILE  http://downloads.datastax.com/community/$_FILE
RUN tar xzvf /tmp/$_FILE -C /opt
RUN ln -sfn $_HOME /opt/$_NAME
RUN rm /tmp/$_FILE

ADD resources $_HOME
ADD etc /etc

RUN find $_HOME -name "*.sh" | xargs chmod 755
RUN chown -R fitbur:fitbur $_HOME

# Expose OpsCenter ports
EXPOSE 8888 61620 50031
# Expose agent ports
EXPOSE 7199 8012 61621

