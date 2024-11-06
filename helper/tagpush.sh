#!/bin/sh

if [ "$(uname -m)" != "x86_64" ]; then
    docker tag platypew/pwnpad:lite platypew/pwnpad:lite-arm64
    docker tag platypew/pwnpad:latest platypew/pwnpad:latest-arm64

    docker push platypew/pwnpad:lite-arm64
    docker push platypew/pwnpad:latest-arm64
else
    docker tag platypew/pwnpad:lite platypew/pwnpad:lite-amd64
    docker tag platypew/pwnpad:latest platypew/pwnpad:latest-amd64

    docker push platypew/pwnpad:lite-amd64
    docker push platypew/pwnpad:latest-amd64
fi
