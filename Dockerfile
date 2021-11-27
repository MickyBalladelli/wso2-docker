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
    echo debconf shared/accepted-oracle-license-v1-3 select true | debconf-set-selections && \
    echo debconf shared/accepted-oracle-license-v1-3 seen true | debconf-set-selections && \
    echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN ACCEPT_EULA=y apt install -y oracle-java17-installer --install-recommends
ENV JAVA_HOME=/usr
RUN echo "JAVA_HOME defined to point to ${JAVA_HOME}"
WORKDIR /app

COPY ./wso2am-4.0.0 /usr/wso2am/

RUN /usr/wso2am/bin/api-manager.sh

CMD ["bash"]