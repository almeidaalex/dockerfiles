FROM java8
RUN apt-get update \
    && apt-get install -y wget

EXPOSE 9092 9092

RUN wget -O kafka.tgz https://www-us.apache.org/dist/kafka/2.2.0/kafka_2.12-2.2.0.tgz -q \
    && mkdir kafka \
    && tar -xzf kafka.tgz -C kafka/ \
    && ls kafka/kafka_2.12-2.2.0

WORKDIR /kafka/kafka_2.12-2.2.0

ENTRYPOINT bin/zookeeper-server-start.sh config/zookeeper.properties 
CMD bin/kafka-server-start.sh config/server.properties