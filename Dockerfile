FROM java:8-jre-alpine
MAINTAINER rahul.jaiswal@tothenew.com
COPY target/KSS-Jenkins-1.0-SNAPSHOT.jar /root/KSS-Jenkins.jar
CMD ["java","-jar","/root/KSS-Jenkins.jar"]
