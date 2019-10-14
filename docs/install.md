## Docker

Setting up traggo/server with docker is pretty easy, you basically just have to start the docker container and you are ready to go:

!!! note 
    Before starting traggo/server you may read the [Configuration](config.md), and change the default password of the admin user.

The traggo/server docker images are multi-arch docker images. This means with our `traggo/server` image supports `amd64`, `386`, `ppc64le` (power pc), `s390x` (IBM Z), `arm64`, `arm v7` (Raspberry PI).

```bash
$ docker run -p 80:3030 -v /opt/traggo/data:/opt/traggo/data traggo/server:latest
```

By default traggo/server runs on port 3030.

`/opt/traggo/data` will contain the sqlite database. This can be configured with the property `TRAGGO_DATABASE_CONNECTION`. 
See [Configuration](config.md).

### docker-compose.yml

```yaml
version: "3.7"
services:
  traggo:
    image: traggo/server:latest
    ports:
      - 3030:3030
    environment:
      TRAGGO_DEFAULT_USER_NAME: "admin"
      TRAGGO_DEFAULT_USER_PASS: "mynewpassword"
    volumes:
      - ./traggodata:/opt/traggo/data
```

## Binary

In this tutorial we set up traggo/server `v0.0.9` on a 64 bit linux server but it should be similar on other platforms.

Download the zip with the binary for your platform from [traggo/server Releases](https://github.com/traggo/server/releases).

```bash
$ wget https://github.com/traggo/server/releases/download/v0.0.9/traggo-server-0.0.9-linux-amd64.zip
```

Unzip the archive.

```bash
$ unzip traggo-server-0.0.9-linux-amd64.zip
```

Make the binary executable.

```bash
$ chmod +x traggo-server-0.0.9-linux-amd64
```

Execute traggo/server. (By default traggo/server is started on port 3030)

!!! note 
    Before starting traggo/server you may read the [Configuration](config.md), and change the default password of the admin user.

```bash
$ sudo ./traggo-0.0.9-linux-amd64
```

## Arch-Linux(aur)

TODO

## Source

See [Build Docs](dev/build.md).
