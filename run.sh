#!/usr/bin/env bash
if [ -z ${1} ]; then
    echo -e "Missing argument box name."
    echo "Usage: ${0} <container name>"
    exit 1
fi

box_name=${1}

echo "Attempting to run container"
docker run -it -d \
    -h ${box_name} \
    --name ${box_name} \
    --privileged \
    pwnbox

if [ $? -ne 0 ]; then
    echo "Attempting to start container"
    docker start ${box_name}
fi

# Get a shell
docker attach ${box_name}
