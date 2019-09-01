#!/usr/bin/env bash
if [ -z ${1} ]; then
    echo -e "Missing argument box name."
    echo "Usage: ${0} <container name>"
    exit 1
fi

box_name=${1}

echo "Making directory..."
mkdir $(pwd)/${box_name} 2> /dev/null
echo "Directory located at: $(pwd)/${box_name}"

docker run -it -d \
    -h ${box_name} \
    -e DISPLAY=host.docker.internal:0 \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    --name ${box_name} \
    --privileged \
    --mount type=bind,source="$(pwd)/${box_name}",target=/mnt/shared \
    platypew/pwnbox2 &> /dev/null

if [ $? -ne 0 ]; then
    echo "Container exists, reattaching..."
    docker start ${box_name} > /dev/null
fi

# Get a shell
docker attach ${box_name}
