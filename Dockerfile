FROM library/ubuntu

COPY oracle/ /var/cache/oracle-jdk11-installer-local/
RUN apt-get update && apt upgrade && \
    apt install -y apt-utils && \
    apt-get install -y software-properties-common
RUN add-apt-repository ppa:linuxuprising/java && \
    echo "deb http://ppa.launchpad.net/linuxuprising/java/ubuntu focal main" | tee /etc/apt/sources.list.d/linuxuprising-java.list && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 73C3DB2A && \
    apt-get update
RUN echo debconf shared/accepted-oracle-license-v1-2 select true | debconf-set-selections && \
    echo debconf shared/accepted-oracle-license-v1-2 seen true | debconf-set-selections && \
    echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections && \
    apt install -y oracle-java11-installer-local



#    apt-get update && apt-get install -y oracle-java11-installer


RUN echo "JAVA_HOME defined to point to ${JAVA_HOME}"
WORKDIR /app

COPY ./wso2am-4.0.0 /usr/wso2am/

# RUN /usr/wso2am/bin/api-manager.sh

CMD ["bash"]