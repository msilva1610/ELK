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
sudo apt-get install python3-pip python3-dev nginx -y
# Pacotes ##########################################################################
echo -e "-- Set Up python virtualenv\n"
sudo pip3 install virtualenv
# DIR ##########################################################################
echo -e "-- mudando para o dir /demoapp\n"
mkdir /home/vagrant/demoapp
cd /home/vagrant/demoapp
# VENV ##########################################################################
echo -e "-- Criando Virtualenv \n"
virtualenv demoappenv
# FLASK ##########################################################################
echo -e "-- Set UP Flask App\n"
pip install uwsgi flask
# APP ##########################################################################
echo -e "-- Copiando os Apps\n"
cp /vagrant/demoapp.py /home/vagrant/demoapp/
cp /vagrant/demoapp.ini /home/vagrant/demoapp/
cp /vagrant/wsgi.py /home/vagrant/demoapp/
# FIREWALL ##########################################################################
echo -e "-- Set UP Firewall\n"
sudo ufw allow 5000
# WSGI ##########################################################################
# echo -e "-- Inicia wsgi na porta 5000\n"
# uwsgi --socket 0.0.0.0:5000 --protocol=http -w wsgi:app

