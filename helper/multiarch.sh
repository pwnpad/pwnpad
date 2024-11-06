#!/bin/sh

docker manifest create platypew/pwnpad:latest platypew/pwnpad:latest-arm64 platypew/pwnpad:latest-amd64
docker manifest create platypew/pwnpad:lite platypew/pwnpad:lite-arm64 platypew/pwnpad:lite-amd64

docker manifest annotate platypew/pwnpad:lite platypew/pwnpad:lite-arm64 --os linux --arch arm64
docker manifest annotate platypew/pwnpad:lite platypew/pwnpad:lite-amd64 --os linux --arch amd64

docker manifest annotate platypew/pwnpad:latest platypew/pwnpad:latest-arm64 --os linux --arch arm64
docker manifest annotate platypew/pwnpad:latest platypew/pwnpad:latest-amd64 --os linux --arch amd64

docker manifest push platypew/pwnpad:lite
docker manifest push platypew/pwnpad:latest

docker manifest rm platypew/pwnpad:latest
docker manifest rm platypew/pwnpad:lite
