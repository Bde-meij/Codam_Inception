# Codam_Inception
project on building a network with docker

docker volume rm $(docker volume ls -q)
docker rmi -f $(docker images -a -q)
docker system prune -af
