#!/bin/bash

# updating image
apk update

# install basic binary
apk --no-cache add wget vim 

# install minio
wget https://dl.min.io/server/minio/release/linux-amd64/minio -O /opt/minio

# create dir to keep data
mkdir /data

# make executable
chmod +x /opt/minio
