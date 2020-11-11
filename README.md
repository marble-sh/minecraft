# Minecraft Docker Image

![Docker](https://github.com/marblenix/minecraft/workflows/Docker/badge.svg)

## Quickstart

```shell
docker run -it --name minecraft -p 25565:25565 --rm -v "$HOME/minecraft":/data marblenix/minecraft:stable
```

Minecraft -> Multiplayer -> Direct Connection -> Server Address: localhost -> Join Server

## Tags

| tag | meaning | example |
|-----|---------|---------|
| latest | follow the latest published release, be that a stable release or a snapshot | v20w46a |
| stable | follow the latest stable release | v1.16.4 |
| versioned | will never change after publish | will always be  v20w45a |

### Stopping a running server

The terminal window is bound to the server input, so typing "stop" should stop the server for you.

## Update an out of date server

```shell
docker pull marblenix/minecraft:stable
```
