# Use a lightweight base image
FROM alpine:latest

# Install necessary tools and the 'wget' command
RUN apk add --no-cache wget tar

# Set the Dragonwell version you are using
ENV JAVA_VERSION=21.0.10.0.10+7
ENV JAVA_HOME=/opt/dragonwell
ENV PATH=$JAVA_HOME/bin:$PATH

# Download and extract the Dragonwell binary from GitHub
RUN wget -q https://github.com/dragonwell-project/dragonwell21/releases/download/dragonwell-standard-${JAVA_VERSION}/Alibaba_Dragonwell_Standard_${JAVA_VERSION}_x64_alpine-linux.tar.gz && \
    mkdir -p ${JAVA_HOME} && \
    tar -xzf Alibaba_Dragonwell_Standard_${JAVA_VERSION}_x64_alpine-linux.tar.gz -C ${JAVA_HOME} --strip-components=1 && \
    rm Alibaba_Dragonwell_Standard_${JAVA_VERSION}_x64_alpine-linux.tar.gz

# Set the working directory
WORKDIR /app

# Copy and run your Spring Boot JAR
COPY target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
