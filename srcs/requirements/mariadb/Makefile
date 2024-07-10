db:
	sudo docker build -t db .
	sudo docker run -it db

clean:
	-sudo docker rm $$(sudo docker ps -aq)
	-sudo docker rmi $$(sudo docker images -aq)