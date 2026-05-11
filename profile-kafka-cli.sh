if [ -n "$PS1" ] || [ -t 0 ]; then
    export KAFKA_OPTS=""
    export KAFKA_JMX_OPTS=""
    export JMX_PORT=""
fi
