FROM alpine:3 as stage1
ARG utility=https://github.com/marblenix/minecraft_downloader/releases/download/latest/minecraft_downloader_linux

RUN apk update
RUN apk add curl ca-certificates
RUN curl -sL "${utility}" -o /minecraft_downloader
RUN chmod +x /minecraft_downloader

FROM openjdk:8-jre-slim
MAINTAINER Cassidy Marble
ARG version=latest
ARG type=release

WORKDIR /data
VOLUME /data

EXPOSE 25565

COPY --from=stage1 /minecraft_downloader /minecraft_downloader
RUN /minecraft_downloader --version=$version --type=$type --output /minecraft.jar
CMD echo eula=true > /data/eula.txt && java -jar /minecraft.jar
