FROM library/ubuntu

RUN apt update && apt upgrade
RUN apt install -y software-properties-common
RUN mkdir -p /var/cache/oracle-jdk11-installer-local/
COPY oracle/ /tmp/
RUN add-apt-repository ppa:linuxuprising/java
RUN apt-get update
RUN apt install /tmp
RUN java --version

RUN echo "JAVA_HOME defined to point to ${JAVA_HOME}"
WORKDIR /app

COPY ./wso2am-4.0.0 /usr/wso2am/

RUN /usr/wso2am/api-manager.sh

CMD ["bash"]