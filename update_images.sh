#!/bin/bash
docker-compose up -d
docker image prune -f
docker volume prune -f
