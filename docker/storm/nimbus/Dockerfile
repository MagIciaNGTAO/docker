FROM fitbur/storm-base

MAINTAINER Sharmarke Aden, saden1@gmail.com

ADD storm-start.sh $_HOME/storm-start.sh
ADD etc/supervisor /etc/supervisor

RUN chmod a+x $_HOME/storm-start.sh

EXPOSE 6627 3772 3773

CMD ["/opt/storm/storm-start.sh"]
