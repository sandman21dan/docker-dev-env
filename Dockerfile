FROM ubuntu:18.04

RUN apt-get update && apt-get upgrade -y
RUN apt-get install software-properties-common -y
RUN apt-add-repository ppa:ansible/ansible
RUN apt-get install python ansible sudo -y
RUN adduser --disabled-password --gecos '' docker
RUN adduser docker sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER docker
COPY ./dev-environment-automation/ /home/docker/ansible-playbook
RUN ansible-playbook --connection=local --inventory 127.0.0.1, /home/docker/ansible-playbook/index.yaml

ENTRYPOINT tail -f /dev/null
