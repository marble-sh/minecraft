# Minecraft Docker Image

![Docker](https://github.com/marblenix/minecraft/workflows/Docker/badge.svg)

## Quickstart

#### MacOS/Linux:
```
docker run -it --name minecraft -p 25565:25565 -v $HOME/minecraft:/data marblenix/minecraft:stable
```

#### Windows:
```
docker run -it --name minecraft -p 25565:25565 -v C:/minecraft:/data marblenix/minecraft:stable
```

Minecraft -> Multiplayer -> Direct Connection -> Server Address: localhost -> Join Server

## Tags

| tag | meaning | current |
|-----|---------|---------|
| latest | follow all releases, including pre-releases and stable releases | <img alt="GitHub release (latest by date including pre-releases)" src="https://img.shields.io/github/v/release/marblenix/minecraft?include_prereleases&label=%20&style=flat-square"> |
| stable | follow the latest stable release | <img alt="GitHub release (latest by date excluding pre-releases)" src="https://img.shields.io/github/v/release/marblenix/minecraft?label=%20&style=flat-square"> |

### Stopping a running server

The terminal window is bound to the server input, so typing "stop" should stop the server for you.

## Update an out of date server

```shell
docker pull marblenix/minecraft:stable
```
