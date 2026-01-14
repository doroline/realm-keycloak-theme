FROM docker pull openjdk:21-slim
ADD . /app
WORKDIR /app

RUN jar cvf target/realm-theme.jar theme
