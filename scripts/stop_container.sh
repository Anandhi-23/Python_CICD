#!/bin/bash
set -e

# Stop the running container (if any)
containerID=$(docker ps --format "{{.ID}}" | awk -F, '{print $1}')
echo "removing container"
docker rm -f $containerID










