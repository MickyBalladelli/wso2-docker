FROM library/ubuntu

COPY oracle/ /var/cache/oracle-jdk11-installer-local/

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:linuxuprising/java && \
    echo debconf shared/accepted-oracle-license-v1-2 select true | debconf-set-selections && \
    echo debconf shared/accepted-oracle-license-v1-2 seen true | debconf-set-selections && \
    apt-get update && apt-get install -y oracle-java11-installer

RUN java --version

RUN echo "JAVA_HOME defined to point to ${JAVA_HOME}"
WORKDIR /app

COPY ./wso2am-4.0.0 /usr/wso2am/

RUN /usr/wso2am/bin/api-manager.sh

CMD ["bash"]