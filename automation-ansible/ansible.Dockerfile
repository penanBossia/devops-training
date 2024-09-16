FROM docker.io/alpine:3.19.0
WORKDIR /opt
RUN apk add --no-cache ca-certificates openssh git ansible make just py3-dnspython py3-passlib
#ENTRYPOINT ["ansible-playbook", "-i", "inventory", "/opt/ansible/playbook.yml"]