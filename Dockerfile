FROM library/ubuntu

RUN apt update && apt upgrade
RUN mkdir -p /var/cache/oracle-jdk11-installer-local/
RUN cp jdk-11.0.5_linux-x64_bin.tar.gz /var/cache/oracle-jdk11-installer-local/
RUN add-apt-repository ppa:linuxuprising/java
RUN apt-get update
RUN apt install oracle-java11-installer-local
RUN java --version

RUN echo "JAVA_HOME defined to point to ${JAVA_HOME}"
WORKDIR /app

COPY ./wso2am-4.0.0 /usr/wso2am/

RUN /usr/wso2am/api-manager.sh

CMD ["bash"]