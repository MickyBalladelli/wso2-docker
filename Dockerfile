FROM store/oracle/jdk:11
RUN echo "JAVA_HOME defined to point to ${JAVA_HOME}"
WORKDIR /app
COPY wso2am-4.0.0 ./wso2am