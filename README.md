# Szpitale

[![CircleCI](https://circleci.com/gh/just3ws/szpitale/tree/master.svg?style=svg)](https://circleci.com/gh/just3ws/szpitale/tree/master)

## Fetch source

```sh
git clone git@github.com:just3ws/szpitale.git
cd szpitale
```

## Setup environment

Assuming that you already have recent `docker` and `docker-compose` installed.

These commands were tested using `Docker version 18.05.0-ce, build f150324` and
`docker-compose version 1.21.2, build a133471` respectively.

```sh
docker-compose up --remove-orphans --build --no-start -V
docker-compose run --rm api ./bin/setup
```

## Run tests

```sh
docker-compose run --rm api bundle exec rspec
```

## Start server

```sh
docker-compose up api
```

```sh
# See the list of hospitals
curl "http://0.0.0.0:3000"
curl "http://0.0.0.0:3000/hospitals"
```

```sh
# Filter by city
curl "http://0.0.0.0:3000/hospitals?city=Chicago"
curl "http://0.0.0.0:3000/hospitals?city=Nowheresville"
```

### Teardown environment

```sh
docker-compose down --remove-orphans --rmi all
```
