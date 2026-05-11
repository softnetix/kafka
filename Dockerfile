FROM confluentinc/cp-kafka:8.2.0

LABEL maintainer="Softnetix"
LABEL version="2.1.0"

USER root

RUN mkdir -p /opt/kafka/jmx && \
    curl -fsSL -o /opt/kafka/jmx/jmx_prometheus_javaagent.jar \
      https://github.com/prometheus/jmx_exporter/releases/download/1.5.0/jmx_prometheus_javaagent-1.5.0.jar

COPY kafka-jmx.yml /opt/kafka/jmx/kafka-jmx.yml

COPY profile-kafka-cli.sh /etc/profile.d/kafka-cli.sh
RUN chmod 644 /etc/profile.d/kafka-cli.sh && \
    echo 'source /etc/profile.d/kafka-cli.sh' >> /etc/bashrc

COPY kafka-cli /usr/local/bin/kafka-cli
RUN chmod 755 /usr/local/bin/kafka-cli
