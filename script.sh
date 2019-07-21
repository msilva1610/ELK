#!/usr/bin/env bash
# Inicio ########################################################################
echo -e "-- ----------------- --\n"
echo -e "-- INICIO ${HOSTNAME} --\n"
echo -e "-- ----------------- --\n"
# BOX ##########################################################################
echo -e "-- Atualizando packages list\n"
sudo apt-get update -y -qq
# Pacotes ##########################################################################
echo -e "-- Atualizando pacotes e dependicias\n"
sudo apt-get install build-essential -y
# Pacotes ##########################################################################
echo -e "-- Atualizando pacotes e dependicias\n"
sudo apt-get install tcl -y
# Pacotes ##########################################################################
echo -e "-- mudando para o dir /tmp\n"
cd /tmp
# Pacotes ##########################################################################
echo -e "-- Downloading redis...\n"
curl -O http://download.redis.io/redis-stable.tar.gz
# tar ##########################################################################
echo -e "-- unzip o pacote redis...\n"
tar xzvf redis-stable.tar.gz
# tar ##########################################################################
echo -e "-- make...\n"
cd redis-stable
make
# instalar ##########################################################################
echo -e "-- instalar redis...\n"
sudo make install
sudo mkdir /etc/redis
echo -e "-- criando arquivo Redis.conf...\n"
