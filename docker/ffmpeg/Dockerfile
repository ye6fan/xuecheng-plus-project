FROM jdk8-ffmpeg
COPY ffmpeg.jar /app/ffmpeg.jar
WORKDIR /app
ENV NACOS_ADDR="nacos:8848"
CMD ["java", "-jar", "ffmpeg.jar", "--spring.cloud.nacos.server-addr=${NACOS_ADDR}"]