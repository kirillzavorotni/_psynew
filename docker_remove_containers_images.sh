#!/bin/bash

# include config
. "$(dirname "$0")/docker_config"

# include stop containers scripts
. "$(dirname "$0")/docker_remove_containers.sh"

echo "Start removing images..."

for key in ${!imageNames[@]}; do
    docker rmi $(docker images --format="{{.Repository}} {{.ID}}" | grep "^${imageNames[${key}]} " | cut -d' ' -f2) -f
done

echo "Images is removed."