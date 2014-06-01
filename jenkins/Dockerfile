FROM fitbur/jdk

MAINTAINER Sharmarke Aden, saden1@gmail.com

ENV _NAME jenkins
ENV _VERSION 1.565
ENV _FILE jenkins.war
ENV _HOME /opt/$_NAME
ENV _SERVICE $_HOME
ENV JENKINS_HOME /out

RUN apt-get install -y git subversion maven ant gradle
RUN apt-get -y clean
RUN apt-get -y autoremove

RUN curl -L -o $_FILE http://mirrors.jenkins-ci.org/war/$_VERSION/$_FILE
RUN mkdir $_HOME
RUN mv $_FILE $_HOME

ADD resources $_HOME
ADD etc /etc

RUN find $_HOME -name "*.sh" | xargs chmod +x
RUN chown -R fitbur:fitbur $_HOME

EXPOSE 8081

