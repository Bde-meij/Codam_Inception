VOL_WORDPRESS = /home/bde-meij/data/wordpress
VOL_MARIADB = /home/bde-meij/data/mariadb

all: up

up: $(VOL_WORDPRESS) $(VOL_MARIADB)
	sudo docker compose -f ./srcs/docker-compose.yml up -d

down:
	sudo docker compose -f ./srcs/docker-compose.yml down

re: clean up

# enter specific container commandline interface during runtime
db:
	sudo docker exec -it mariadb bash

wp:
	sudo docker exec -it wordpress bash

x:
	sudo docker exec -it nginx bash

check:
	sudo docker system df

$(VOL_WORDPRESS):
	sudo mkdir -p $@

$(VOL_MARIADB):
	sudo mkdir -p $@

clean: down
	-sudo docker stop $$(sudo docker ps -aq)
	yes | sudo docker system prune -a
	
fclean: clean
	yes | sudo docker volume prune
	-sudo rm -rf $(VOL_WORDPRESS)
	-sudo rm -rf $(VOL_MARIADB)
