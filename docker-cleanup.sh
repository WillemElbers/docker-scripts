#!/bin/sh
#Clean exited containers (CAREFULL):
docker rm -v $(docker ps -a -q -f status=exited)

#Clean images:
docker rmi $(docker images -f "dangling=true" -q)

#Clean dangling volumes
docker volume rm $(docker volume ls -qf dangling=true)
