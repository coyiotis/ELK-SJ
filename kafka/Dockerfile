FROM centos:7.4.1708

ENV SCALA_HOME=/opt/scala \
    KAFKA_HOME=/opt/kafka

RUN yum install wget -y; yum clean all

# Get and install java
RUN wget -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm -O /tmp/jdk-8u131-linux-x64.rpm
RUN yum localinstall /tmp/jdk-8u131-linux-x64.rpm -y
RUN rm -rf /tmp/*.rpm

# Get and install kafka
RUN wget -c https://archive.apache.org/dist/kafka/2.2.2/kafka_2.12-2.2.2.tgz -O /tmp/kafka_2.12-2.2.2.tgz
RUN tar -xvzf /tmp/kafka_2.12-2.2.2.tgz -C /opt
RUN ln -s /opt/kafka_2.12-2.2.2 ${KAFKA_HOME}


# Get and install scala
RUN wget -c https://downloads.lightbend.com/scala/2.12.4/scala-2.12.4.tgz -O /tmp/scala-2.12.4.tgz
RUN tar -xvzf /tmp/scala-2.12.4.tgz -C /opt
RUN ln -s /opt/scala-2.12.4 ${SCALA_HOME}

WORKDIR /opt/kafka
ENV PATH=${PATH}:${SCALA_HOME}/bin:${KAFKA_HOME}/bin

RUN mkdir -p /opt/kafka/config
RUN mkdir -p /entrypoint

ENTRYPOINT ["/entrypoint/entrypoint.sh"]
