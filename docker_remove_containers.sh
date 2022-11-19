#!/bin/bash

# include config
. "$(dirname "$0")/docker_config.sh"


echo "Start removing containers..."

for key in ${!containerNames[@]}; do
    docker rm $(docker stop $(docker ps -aqf name=${containerNames[${key}]}))
done

echo "Containers is removed."