FROM prakashul/knowledgemeet:km
MAINTAINER "prakashul@tothenew.com"
COPY ${WORKSPACE}/target/KSS-Jenkins-1.0-SNAPSHOT.jar /root/KSS-Jenkins.jar
COPY ${WORKSPACE}/entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh 
CMD ["/entrypoint.sh"]
