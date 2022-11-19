. "$(dirname "$0")/docker_config.sh"

# run docker container command in the started containers
NODEJS_BACK_CONTAINER_NAME=${containerNames[NODEJS_BACK_CONTAINER_NAME]}

#docker exec -it $(docker ps -aqf name=${NODEJS_BACK_CONTAINER_NAME}) npm install
#docker exec -it $(docker ps -aqf name=${NODEJS_BACK_CONTAINER_NAME}) npm run migrations