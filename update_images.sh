#!/bin/bash
docker-compose down
docker-compose up -d
docker image prune -f
docker volume prune -f
