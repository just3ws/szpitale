# Szpitale

## Setup environment

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

### Teardown environment

```sh
docker-compose down --remove-orphans --rmi all
```
