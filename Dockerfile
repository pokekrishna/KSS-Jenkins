FROM prakashul/knowledgemeet:km
MAINTAINER "prakashul@tothenew.com"
COPY ${WORKSPACE}/target/KSS-Jenkins-1.0-SNAPSHOT.jar /root/KSS-Jenkins.jar
CMD ["/bin/bash", "/entrypoint.sh"]
