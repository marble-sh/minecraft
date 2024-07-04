FROM alpine:latest as fetch
ARG manifest=https://launchermeta.mojang.com/mc/game/version_manifest.json

RUN apk add --no-cache curl ca-certificates jq openjdk21-jdk openjdk21-jmods openjdk21-static-libs binutils

RUN curl -fsSL "${manifest}" -o manifest.json
RUN jq -r '.latest.release' manifest.json | tee release_version
RUN curl -fsSL "$(jq -r '.versions[] | select(.id=="'"$(cat release_version)"'") | .url' manifest.json)" -o release_manifest.json
RUN jq -r '.downloads.server | "\(.sha1) \("server.jar")"' release_manifest.json | tee server.jar.shasum
RUN curl -fsSL "$(jq -r '.downloads.server.url' release_manifest.json)" -o server.jar
RUN sha1sum -c server.jar.shasum

# build minimal JRE
RUN jlink \
    --verbose \
    --add-modules ALL-MODULE-PATH \
    --compress zip-9 --strip-debug --no-header-files --no-man-pages \
    --output /opt/java

FROM alpine:latest

COPY --from=fetch server.jar server.jar
COPY --from=fetch /opt/java /opt/java

ENV PATH="$PATH:/opt/java/bin"

RUN addgroup -S minecraft && adduser -D -H -S minecraft -G minecraft && \
    mkdir /data && \
    echo eula=true > /data/eula.txt && \
    chown minecraft:minecraft /data

WORKDIR /data
VOLUME /data

# USER minecraft

EXPOSE 25565

ENTRYPOINT ["java", "-jar", "/server.jar"]
