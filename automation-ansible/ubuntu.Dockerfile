FROM ubuntu:22.04
RUN apt-get update && apt-get install openssh-server -y && apt-get install vim -y