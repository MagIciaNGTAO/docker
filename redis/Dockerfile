FROM fitbur/builder

MAINTAINER Sharmarke Aden, saden1@gmail.com

ENV _NAME redis
ENV _VERSION 2.8.9
ENV _FILE $_NAME-$_VERSION.tar.gz
ENV _HOME /opt/$_NAME-$_VERSION
ENV _SERVICE /opt/$_NAME

RUN curl -L -o $_FILE http://download.redis.io/releases/$_FILE
RUN tar xzvf $_FILE

# Make, test, and install redis using parallel build process. Note that this 
# all these commands must be run a the same time as docker can't cd into the 
# extracted folder.
RUN cd $_NAME-$_VERSION && make -j && make -j test && make PREFIX=$_HOME install
RUN ln -sfn $_HOME $_SERVICE
RUN rm -rf $_FILE $_NAME-$_VERSION

ADD resources $_HOME
ADD etc /etc

RUN find $_HOME -name "*.sh" | xargs chmod +x
RUN chown -R fitbur:fitbur $_HOME

EXPOSE 6379


