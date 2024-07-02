VOL_WORDPRESS = /home/bde-meij/data/wordpress
VOL_MARIADB = /home/bde-meij/data/mariadb

all: up

up: $(VOL_WORDPRESS) $(VOL_MARIADB)
	sudo docker compose -f ./srcs/docker-compose.yml up -d
	
down:
	sudo docker compose -f ./srcs/docker-compose.yml down

clean: down
	-sudo docker stop $(sudo docker ps -aq)
	-sudo docker rm $(sudo docker ps -aq)
	-sudo docker rmi $(sudo docker images -aq)
	yes | sudo docker system prune -a
	yes | sudo docker volume prune -a
	-sudo rm -rf $(VOL_WORDPRESS)
	-sudo rm -rf $(VOL_MARIADB)

# execution style
# sudo docker exec -it nginx sh
# sudo docker exec -it mariadb sh
# sudo docker exec -it wordpress sh
