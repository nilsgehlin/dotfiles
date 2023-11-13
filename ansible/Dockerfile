FROM ubuntu:22.04 AS base
WORKDIR /usr/local/bin
ENV DEBIAN_FRONTEND=noninteractive
RUN addgroup --gid 1000 nige
RUN adduser --gecos nige --uid 1000 --gid 1000 --disabled-password nige
WORKDIR /home/nige
# COPY . .
# RUN ./install_ansible.sh
# RUN ansible-playbook local.yml
