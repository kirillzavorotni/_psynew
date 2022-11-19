#!/bin/bash

# include config
. "$(dirname "$0")/docker_config.sh"


DOCKER_COMPOSE_COMMAND=''
for key in ${!containerNames[@]}; do
    DOCKER_COMPOSE_COMMAND+="${key}=${containerNames[${key}]} "
done
for key in ${!imageNames[@]}; do
    DOCKER_COMPOSE_COMMAND+="${key}=${imageNames[${key}]} "
done

DOCKER_COMPOSE_COMMAND+="BACK_APP_EXTERNAL_PORT=$BACK_APP_EXTERNAL_PORT POSTGRES_EXTERNAL_PORT=$POSTGRES_EXTERNAL_PORT "
DOCKER_COMPOSE_COMMAND+="docker-compose up -d"

echo "Start command: "
echo ${DOCKER_COMPOSE_COMMAND}

eval ${DOCKER_COMPOSE_COMMAND}

set -e

>&2 echo "Check $NODEJS_BACK_CONTAINER_NAME conteiner for available"

until curl http://localhost:"$BACK_APP_EXTERNAL_PORT"; do
  >&2 echo "Conteiner $NODEJS_BACK_CONTAINER_NAME is unavailable on http://localhost:"$BACK_APP_EXTERNAL_PORT" host"
  sleep 3
done

>&2 echo "Conteiner $NODEJS_BACK_CONTAINER_NAME is up on http://localhost:"$BACK_APP_EXTERNAL_PORT" host"

. "$(dirname "$0")/docker_run_commands_in_container.sh"
