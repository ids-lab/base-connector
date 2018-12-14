FROM openjdk:8-jre-alpine

# set activemq version
ENV ACTIVEMQ_VERSION 5.14.3

# install some packages
# 1. update index (same as apt-get update on debian)
# 2. install new packages
# 3. clean up index
RUN apk update \
  && apk add rsync \
  && rm -rf /var/cache/akp/*    

WORKDIR /opt

# install activemq
RUN set -e \
  && wget -O - http://archive.apache.org/dist/activemq/${ACTIVEMQ_VERSION}/apache-activemq-${ACTIVEMQ_VERSION}-bin.tar.gz \
  | tar -xz \
  && mv /opt/apache-activemq-${ACTIVEMQ_VERSION} /opt/activemq \
  && cp -R /opt/activemq /opt/.activemq_bak

# run.sh copies mounted activemq files and starts activemq
COPY run.sh /app/run.sh
RUN chmod +x /app/run.sh

VOLUME /execution-core-container
VOLUME /opt/activemq/data

WORKDIR /opt/activemq
ENTRYPOINT ["/app/run.sh"]