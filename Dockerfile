#FROM openjdk:8-jdk
#RUN apt-get update
#RUN apt-get install -y maven
#COPY pom.xml /usr/local/service/pom.xml
#
#RUN apt-get update && apt-get install -y \
#    software-properties-common \
#    unzip \
#    curl \
#    xvfb
#RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
#
#
#    # Chrome browser to run the tests
#RUN curl https://dl-ssl.google.com/linux/linux_signing_key.pub -o /tmp/google.pub \
#        && cat /tmp/google.pub | apt-key add -; rm /tmp/google.pub \
#        && echo 'deb http://dl.google.com/linux/chrome/deb/ stable main' > /etc/apt/sources.list.d/google.list \
#        && mkdir -p /usr/share/desktop-directories \
#        && apt-get -y update && apt-get install -y google-chrome-stable
##    # Disable the SUID sandbox so that chrome can launch without being in a privileged container
#RUN dpkg-divert --add --rename --divert /opt/google/chrome/google-chrome.real /opt/google/chrome/google-chrome \
#        && echo "#!/bin/bash\nexec /opt/google/chrome/google-chrome.real --no-sandbox --disable-setuid-sandbox \"\$@\"" > /opt/google/chrome/google-chrome \
#        && chmod 755 /opt/google/chrome/google-chrome
##
##    # Chrome Driver
##RUN mkdir -p /opt/selenium \
##        && curl http://chromedriver.storage.googleapis.com/2.45/chromedriver_linux64.zip -o /opt/selenium/chromedriver_linux64.zip \
##        && cd /opt/selenium; unzip /opt/selenium/chromedriver_linux64.zip; rm -rf chromedriver_linux64.zip; ln -fs /opt/selenium/chromedriver /usr/local/bin/chromedriver;
#
#COPY src /usr/local/service/src
#        #COPY test /usr/local/service/test
#WORKDIR /usr/local/service
#RUN mvn package
#CMD ["java","-cp","target/NewProject-1.0-SNAPSHOT.jar", "MainTest"]
#

FROM openjdk:8-jdk
RUN apt-get update
RUN apt-get install -y maven
COPY src /usr/local/service/src
COPY pom.xml /usr/local/service
COPY Regression.xml /usr/local/service
WORKDIR /usr/local/service
RUN mvn -f /usr/local/service/pom.xml clean test -DsuiteXmlFile=/usr/local/service/Regression.xml

