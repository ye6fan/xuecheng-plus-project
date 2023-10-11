FROM jdk8-ffmpeg
COPY video.jar /app/video.jar
WORKDIR /app
ENV NACOS_ADDR="nacos:8848"
CMD ["java", "-jar", "video.jar", "--spring.cloud.nacos.server-addr=${NACOS_ADDR}"]