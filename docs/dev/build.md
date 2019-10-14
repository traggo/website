# Build from sources

The steps below require that you have setup your dev environment and have ran `make generate`.

!!! node
    The project has a CGO reference (because of sqlite3), therefore a CGO cross compiler is needed for compiling for
    other platforms (the traggo/build docker images already contain the needed cross compilers).

## Build without docker

You can build traggo/server with the following command:
```bash
$ make build-bin-local
```

## Build with docker

It is recommended to build traggo/server via the [traggo/build docker images](https://github.com/traggo/build), this ensures
that all the required tools are available (like f.ex. cross-compiler).

Execute [traggo/server Makefile](https://github.com/traggo/server/blob/master/Makefile) tasks to build traggo/server.

```bash
# builds all supported platforms
$ make build-bin
# builds a specific platform
# available suffixes
# * linux-amd64
# * linux-386
# * linux-arm-7
# * linux-arm64
# * linux-ppc64le
# * linux-s390x
# * windows-amd64
# * windows-386

# Build bin
$ make build-bin-SUFFIX 
# Build docker image (requires bin build before)
$ make build-docker-SUFFIX 
```

