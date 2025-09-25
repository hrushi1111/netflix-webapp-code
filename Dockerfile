# Step 1: Use Maven to build the WAR
FROM maven:3.9.4-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Step 2: Use Tomcat to run the WAR
FROM tomcat:9.0-jdk17
COPY tomcat-users.xml /usr/local/tomcat/conf/
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/netflix.war
