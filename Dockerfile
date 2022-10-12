FROM openjdk:17-oracle
ARG JAR_FILE=target/*SNAPSHOT.jar
COPY $JAR_FILE application.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/application.jar"]