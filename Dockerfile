FROM tomcat:9.0-jdk17
COPY tomcat-users.xml /usr/local/tomcat/conf/
COPY target/*.war /usr/local/tomcat/webapps/netflix.war
