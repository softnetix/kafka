FROM  apache/kafka:4.0.0

LABEL maintainer="Softnetix"
LABEL version="1.1.0"

USER root

# Download jmx_prometheus_javaagent
RUN mkdir -p /opt/kafka/jmx && wget -O /opt/kafka/jmx/jmx_prometheus_javaagent.jar \
    https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/1.0.1/jmx_prometheus_javaagent-1.0.1.jar

COPY kafka-jmx.yml /opt/kafka/jmx/kafka-jmx.yml