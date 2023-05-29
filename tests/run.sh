#!/usr/bin/env bash

mkdir -p ./serpbear_appdata
mkdir -p ./data
chown -R 1001:1001 ./serpbear_appdata
chown -R 1001:1001 ./data


docker-compose up -d;
sleep 45s;