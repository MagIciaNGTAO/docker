FROM fitbur/base

ENV VERSION 1.0.1
ENV ES_FILE elasticsearch-$VERSION.tar.gz
ENV ES_HOME /opt/elasticsearch-$VERSION

RUN wget --no-check-certificate https://download.elasticsearch.org/elasticsearch/elasticsearch/$ES_FILE -O /tmp/$ES_FILE
RUN tar xzvf /tmp/$ES_FILE -C /opt
RUN ln -sfn $ES_HOME /opt/elasticsearch 
RUN $ES_HOME/bin/plugin -install mobz/elasticsearch-head

RUN mkdir -p /out

VOLUME [ "/out" ]

EXPOSE 9200
EXPOSE 9300

CMD ["/opt/elasticsearch/bin/elasticsearch", "-f", "-D", "es.path.logs=/out", "-D", "es.path.data=/out", "-D", "es.network.publish_host=127.0.0.1", "-D", "es.cluster.name=search-localhost" ]
