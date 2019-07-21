
# Comando para iniciar o wsgi
```
uwsgi --ini uwsgi.ini
```

## Setup do Servidor Ubuntu

```
sudo apt-get update -y
sudo apt-get install python3-pip python3-dev nginx -y
```

## Setup do python virtualenv

```
sudo pip3 install virtualenv

mkdir ~/demoapp
cd ~/demoapp
virtualenv demoappenv
source demoappenv/bin/activate
```

## Set Up flask application

```
pip install uwsgi flask

```

## Set Up de firewall
```
sudo ufw allow 5000
```

## start wsgi
```
uwsgi --socket 0.0.0.0:5000 --protocol=http -w wsgi:app
```

