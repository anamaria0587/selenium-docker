FROM openjdk:13-jdk-alpine

RUN apk add curl jq
#Workspace
WORKDIR /user/share/testngdocker
#ADD .jar under target from host into this image
ADD target/selenium-docker.jar        selenium-docker.jar
ADD target/selenium-docker-tests.jar  selenium-docker-tests.jar
ADD target/libs                       libs
#if there are any other dependencies like .csv, .xls, .json, please add them too
#ADD suite files
ADD book-flight-module.xml            book-flight-module.xml
ADD search-module.xml                 search-module.xml
#BROWSER
#HUB_HOST
#MODULE
#RUN chmod 777 -R /user/share/testngdocker
#Add healthcheck script
ADD healthcheck.sh                    healthcheck.sh

ENTRYPOINT sh healthcheck.sh