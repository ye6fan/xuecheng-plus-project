FROM openjdk:8
COPY orders.jar /app/orders.jar
WORKDIR /app
CMD ["java", "-Dfile.encoding=utf-8", "-jar", "orders.jar"]