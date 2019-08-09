#!/usr/bin/env bash
if [ -z ${1} ]; then
    echo -e "Missing argument box name."
    echo "Usage: ${0} <container name>"
    exit 1
fi

box_name=${1}

echo "Cleaning directory"
rmdir $(pwd)/${box_name} 2> /dev/null

if [ $? -ne 0 ]; then
    echo "Directory not empty, not removing..."
fi

echo "Attempting to remove container"
docker rm ${box_name} -f &> /dev/null

if [ $? -ne 0 ]; then
    echo "Container does not exist"
fi
