FROM adoptopenjdk/openjdk11 as builder
MAINTAINER shiva
RUN apt-get update && apt-get install -y maven
RUN mkdir -p /app/source
COPY . /app/source
WORKDIR /app/source
RUN mvn clean package

FROM amazoncorretto:11-alpine-jdk
MAINTAINER shiva
COPY --from=builder /app/source/target/*.jar /app/app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
