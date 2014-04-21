FROM fitbur/base

ENV _VERSION 1.1.1
ENV _FILE elasticsearch-$_VERSION.tar.gz
ENV _HOME /opt/elasticsearch-$_VERSION
ENV _SERVICE /opt/elasticsearch

RUN wget --no-check-certificate https://download.elasticsearch.org/elasticsearch/elasticsearch/$_FILE -O /tmp/$_FILE
RUN tar xzvf /tmp/$_FILE -C /opt
RUN ln -sfn $_HOME $_SERVICE
RUN rm /tmp/$_FILE

RUN $_HOME/bin/plugin -install mobz/elasticsearch-head

RUN mkdir -p /out

ADD elasticsearch.yml $_HOME/config/elasticsearch.yml
ADD logging.yml $_HOME/config/logging.yml
ADD elasticsearch-start.sh $_HOME/elasticsearch-start.sh

RUN chmod a+x $_HOME/elasticsearch-start.sh
RUN sed -i "s#HOME_CONFIG#$_HOME/config#g" $_HOME/config/elasticsearch.yml

VOLUME [ "/out" ]

EXPOSE 9200
EXPOSE 9300

CMD ["/opt/elasticsearch/elasticsearch-start.sh"]
