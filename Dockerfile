FROM maven:3.6.3-jdk-14 AS build
COPY /kisaco-backend/src /home/app/src
COPY /kisaco-backend/pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package

FROM openjdk:14-jdk
COPY --from=build /home/app/target/application-0.0.1.jar /usr/local/lib/app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/local/lib/app.jar"]