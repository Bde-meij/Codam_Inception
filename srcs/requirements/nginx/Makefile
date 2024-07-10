x:
	sudo docker build -t x .
	sudo docker run -it x

clean:
	-sudo docker rm $$(sudo docker ps -aq)
	-sudo docker rmi $$(sudo docker images -aq)