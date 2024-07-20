
FROM openjdk:11
EXPOSE 8080
ADD target/boardgame.jar boardgame.jar
ENTRYPOINT ["java", "-jar", "/boardgame.jar"]
