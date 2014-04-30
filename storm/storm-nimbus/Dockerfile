FROM fitbur/storm-base

MAINTAINER Sharmarke Aden, saden1@gmail.com

ENV _VERSION 0.9.1

ADD resources $_HOME
ADD etc /etc

RUN find $_HOME -name "*.sh" | xargs chmod +x
RUN chown -R fitbur:fitbur $_HOME

EXPOSE 6627 3772 3773

