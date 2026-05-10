FROM confluentinc/cp-kafka:8.2.0

LABEL maintainer="Softnetix"
LABEL version="2.0.0"

USER root

# Download jmx_prometheus_javaagent
RUN mkdir -p /opt/kafka/jmx && \
    curl -fsSL -o /opt/kafka/jmx/jmx_prometheus_javaagent.jar \
      https://github.com/prometheus/jmx_exporter/releases/download/1.5.0/jmx_prometheus_javaagent-1.5.0.jar

COPY kafka-jmx.yml /opt/kafka/jmx/kafka-jmx.yml
