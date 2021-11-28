FROM library/ubuntu

COPY oracle/ /var/cache/oracle-jdk11-installer-local/
RUN apt-get update && apt upgrade
RUN apt install -y apt-utils && \
    apt-get install -y software-properties-common
RUN add-apt-repository ppa:linuxuprising/java && \
    add-apt-repository ppa:openjdk-r/ppa
RUN apt-get update --fix-missing && \
    ACCEPT_EULA=y apt install -y openjdk-11-jdk


ENV JAVA_HOME=/usr
RUN echo "JAVA_HOME defined to point to ${JAVA_HOME}"
WORKDIR /app

COPY ./wso2am-4.0.0 /usr/wso2am/ 

CMD ["/usr/wso2am/bin/api-manager.sh"]
#CMD ["bash"]