FROM fitbur/base

MAINTAINER Sharmarke Aden, saden1@gmail.com

ENV ONS_VERSION 2.1.57
ENV ONS_FILE kv-ce-$ONS_VERSION.tar.gz
ENV ONS_HOME /opt/kv-$ONS_VERSION

RUN wget http://download.oracle.com/otn-pub/otn_software/nosql-database/kv-ce-2.1.57.tar.gz -O /tmp/$ONS_FILE
RUN tar xzvf /tmp/$ONS_FILE -C /opt
RUN ln -sfn $ONS_HOME /opt/onosql 

RUN mkdir -p /out

VOLUME [ "/out" ]

EXPOSE 5000
EXPOSE 5001

CMD ["java", "-jar","/opt/onosql/lib/kvstore.jar", "kvlite", "-root", "/out"]

