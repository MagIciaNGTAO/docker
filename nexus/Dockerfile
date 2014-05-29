FROM fitbur/jre

MAINTAINER Sharmarke Aden, saden1@gmail.com

ENV _NAME nexus
ENV _VERSION 2.8.0
ENV _FILE $_NAME-$_VERSION-bundle.tar.gz
ENV _HOME /opt/$_NAME-$_VERSION-05
ENV _SERVICE /opt/$_NAME
ENV PLEXUS_NEXUS_WORK /out

RUN curl -L -o $_FILE http://download.sonatype.com/nexus/oss/$_FILE
RUN tar xzvf $_FILE -C /opt
RUN ln -sfn $_HOME $_SERVICE
RUN rm $_FILE

ADD resources $_HOME
ADD etc /etc

RUN find $_HOME -name "*.sh" | xargs chmod +x
RUN chown -R fitbur:fitbur $_HOME

EXPOSE 8081


