# Use an official Alibaba Dragonwell 21 image from Alibaba Cloud Container Registry
FROM registry.cn-hangzhou.aliyuncs.com/acs/dragonwell:21

WORKDIR /app
COPY target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
