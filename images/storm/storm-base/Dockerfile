FROM fitbur/jdk

MAINTAINER Sharmarke Aden, saden1@gmail.com

ENV _NAME storm
ENV _VERSION 0.9.1
ENV _FILE apache-$_NAME-$_VERSION-incubating.zip
ENV _HOME /opt/apache-$_NAME-$_VERSION-incubating

RUN wget http://archive.apache.org/dist/incubator/$_NAME/apache-$_NAME-$_VERSION-incubating/$_FILE -O /tmp/$_FILE
RUN unzip -o /tmp/$_FILE -d /opt
RUN rm /tmp/$_FILE
RUN ln -sfn $_HOME /opt/$_NAME 
RUN ln -s $_HOME/bin/$_NAME /usr/bin/$_NAME

ADD resources $_HOME

RUN find $_HOME -name "*.sh" | xargs chmod 755
RUN chown -R fitbur:fitbur $_HOME

# Run supervised services
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]


