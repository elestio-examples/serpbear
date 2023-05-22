#!/usr/bin/env bash

mkdir -p ./data

chown -R 1000:1000 ./data

docker-compose up -d;
sleep 30s;