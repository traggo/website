# Setup Developer Environment

## Requirements

- Go 1.12+
- Node 11.x
- Yarn 9+
- Docker (optional)

## Clone sources

Clone traggo/server source from git:

```bash
$ git clone https://github.com/traggo/server.git && cd server
```

## Env Variables

If you are in GOPATH, enable [go modules](https://github.com/golang/go/wiki/Modules) explicitly:

```bash
$ export GO111MODULE=on
```

## Download tools

This contains tools for formatting and linting.

```bash
$ make download-tools
```

## Install dependencies

Install Go and Yarn dependencies.

```bash
# make install
```

## Code Generation

The server and ui depends heavily on graphql, for this we use code generators which generate models and resolvers from 
our [schema.graphql](https://github.com/traggo/server/blob/master/schema.graphql). 
The following command shoud be executed after any change to the file.

```bash
$ make generate
```

## Formatting Code

Both the server and the ui uses tooling for formatting the code. You can format all files with:

```bash
$ make format
```

## Linting

We use multiple linters for our code. You can run them all with

```bash
$ make lint
```

## Starting the server

```bash
$ go run main.go
```

This starts the traggo server on `localhost3030`.

!!! node
    When traggo is started in dev mode (which is by default enabled) then it will load additional config files.
    
    * Normal Env Variables
    * `.env.development.local`
    * `.env.development`
    * The rest from [Configuration#precedence](../config.md#precedence).
    
    The `.env.development.local`-file should be used for local changes as it is git ignored.

## Starting the React-UI

_Commands must be executed inside the ui directory._

> Note: Please provide NODE_OPTIONS=--openssl-legacy-provider to the start command
> to workaround a known issue https://github.com/traggo/server/issues/201

```bash
$ NODE_OPTIONS=--openssl-legacy-provider yarn start
```
The ui development server will be started on `localhost:3000`.
