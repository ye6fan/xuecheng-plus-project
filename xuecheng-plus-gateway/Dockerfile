FROM openjdk:8
COPY gateway.jar /app/gateway.jar
WORKDIR /app
CMD ["java", "-Dfile.encoding=utf-8", "-jar", "gateway.jar"]