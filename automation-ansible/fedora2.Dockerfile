FROM fedora
RUN yum update -y && yum install -y openssh-server