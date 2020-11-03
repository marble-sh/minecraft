# Minecraft Docker Image

![Docker](https://github.com/marblenix/minecraft/workflows/Docker/badge.svg)

## Quickstart

```shell
docker run -it --name minecraft -p 25565:25565 --rm -v "$HOME/minecraft":/data marblenix/minecraft:latest
```

Minecraft -> Multiplayer -> Direct Connection -> Server Address: localhost -> Join Server

### Stopping a running server

The terminal window is bound to the server input, so typing "stop" should stop the server for you.

## Update an out of date server

```shell
docker pull marblenix/minecraft
```
