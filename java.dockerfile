FROM debian:jessie
RUN  apt-get update \
     && apt-get install -y wget \
     && apt-get install -y tar

#downloads java e decompress.
RUN wget -O jdk.tar.gz https://download.java.net/java/GA/jdk11/9/GPL/openjdk-11.0.2_linux-x64_bin.tar.gz -q \
    &&  mkdir /opt/jdk \
    && tar -zxvf jdk.tar.gz -C /opt/jdk \
    && update-alternatives --install /usr/bin/java java /opt/jdk/jdk-11.0.2/bin/java 100 \
    && update-alternatives --install /usr/bin/javac javac /opt/jdk/jdk-11.0.2/bin/javac 100

ENTRYPOINT [ "java","-version" ]
