#!/bin/bash
docker-compose down
docker-compose stop
docker-compose kill
docker-compose up -d
docker image prune -f
docker volume prune
