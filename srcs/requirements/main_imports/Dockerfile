FROM debian:bullseye

RUN apt-get update
RUN apt-get upgrade -y

# all containers require these three lines, 
# the other containers depend on this one to avoid
# downloading the same thing multiple times