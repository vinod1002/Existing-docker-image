#!/bin/bash

# Variables
IMAGE_NAME="docker:latest"
CONTAINER_NAME="my-container"
SCRIPT_CONTENT="#!/bin/sh\n echo 'Hello, Docker!'"
SCRIPT_NAME="entrypoint.sh"
DESTINATION_PATH="/usr/src/app/$SCRIPT_NAME"

# Create the script
echo -e $SCRIPT_CONTENT > $SCRIPT_NAME
chmod +x $SCRIPT_NAME

# Pull the Docker image
docker pull $IMAGE_NAME

# Run the container with Docker socket mounted for Docker-in-Docker (DinD)
docker run -d --name $CONTAINER_NAME -v /var/run/docker.sock:/var/run/docker.sock $IMAGE_NAME tail -f /dev/null

# Copy the script into the container
docker cp $SCRIPT_NAME $CONTAINER_NAME:$DESTINATION_PATH

# Make the script executable inside the container
docker exec $CONTAINER_NAME chmod +x $DESTINATION_PATH

# Execute the script inside the container
docker exec $CONTAINER_NAME $DESTINATION_PATH
