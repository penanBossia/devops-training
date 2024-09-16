FROM fedora:42
RUN yum update -y && yum install -y openssh-server