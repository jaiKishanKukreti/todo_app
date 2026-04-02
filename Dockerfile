FROM alpine:latest

RUN apk add --no-cache wget tar

# Using the exact version as defined in the environment variable
ENV JAVA_VERSION=21.0.10.0.10+7
ENV JAVA_HOME=/opt/dragonwell
ENV PATH=$JAVA_HOME/bin:$PATH

# Define the base URL and correctly format the filename
ENV RELEASE_TAG=dragonwell-standard-${JAVA_VERSION}_jdk-21.0.10-ga
ENV FILENAME=Alibaba_Dragonwell_Standard_${JAVA_VERSION/\+/\.}_x64_alpine-linux.tar.gz

# Download and extract
RUN wget -q https://github.com/dragonwell-project/dragonwell21/releases/download/${RELEASE_TAG}/${FILENAME} && \
    mkdir -p ${JAVA_HOME} && \
    tar -xzf ${FILENAME} -C ${JAVA_HOME} --strip-components=1 && \
    rm ${FILENAME}

WORKDIR /app
COPY target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
