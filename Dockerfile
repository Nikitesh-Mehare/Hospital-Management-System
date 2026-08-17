# Build a live Tomcat image around the already-built WAR file.
# Build the WAR first in NetBeans: right-click project -> Clean and Build.
# That produces dist/hms.war -- this Dockerfile just ships it.

FROM tomcat:9.0-jdk17

# Remove Tomcat's default sample apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Deploy hms.war as the ROOT app so it's served at "/"
COPY dist/hms.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
