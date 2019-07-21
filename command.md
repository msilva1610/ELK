
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
cp /vagrant/demoapp.py ~/demoapp/
cp /vagrant/demoapp.ini ~/demoapp/
cp /vagrant/wsgi.py ~/demoapp/
```

## Set Up flask application

```
pip install uwsgi flask

```

## Set Up de firewall
```
sudo ufw allow 5000
```

```
# Não esquecer de dar um CRTL-C no python
```

## testando wsgi
```
uwsgi --socket 0.0.0.0:5000 --protocol=http -w wsgi:app
```

Resultado:
```
*** Starting uWSGI 2.0.18 (64bit) on [Sun Jul 21 17:12:35 2019] ***
compiled with version: 5.4.0 20160609 on 21 July 2019 17:09:09
os: Linux-4.4.0-148-generic #174-Ubuntu SMP Tue May 7 12:20:14 UTC 2019
nodename: nginx01
machine: x86_64
clock source: unix
detected number of CPU cores: 2
current working directory: /home/vagrant/demoapp
detected binary path: /home/vagrant/demoapp/demoappenv/bin/uwsgi
!!! no internal routing support, rebuild with pcre support !!!
*** WARNING: you are running uWSGI without its master process manager ***
your processes number limit is 3897
your memory page size is 4096 bytes
detected max file descriptor number: 1024
lock engine: pthread robust mutexes
thunder lock: disabled (you can enable it with --thunder-lock)
uwsgi socket 0 bound to TCP address 0.0.0.0:5000 fd 3
Python version: 3.5.2 (default, Nov 12 2018, 13:43:14)  [GCC 5.4.0 20160609]
*** Python threads support is disabled. You can enable it with --enable-threads ***
Python main interpreter initialized at 0xe12e30
your server socket listen backlog is limited to 100 connections
your mercy for graceful operations on workers is 60 seconds
mapped 72904 bytes (71 KB) for 1 cores
*** Operational MODE: single process ***
WSGI app 0 (mountpoint='') ready in 0 seconds on interpreter 0xe12e30 pid: 8365 (default app)
*** uWSGI is running in multiple interpreter mode ***
spawned uWSGI worker 1 (and the only) (pid: 8365, cores: 1)
```
## Validar no Browser

```
http://server_domain_or_IP:5000
```

## Desativar o virtualenv

```
deactivate
```

## systemd init file
```
sudo cp /vagrant/demoapp.service /etc/systemd/system/
```

## Reiniciando os services

```
sudo systemctl start demoapp
sudo systemctl enable demoapp
```

## Nginx to Proxy Requests
/etc/nginx/sites-available/demoapp
```
server {
    listen 80;
    server_name 192.168.100.10;
    location / {
        include uwsgi_params;
        uwsgi_pass unix:/home/vagrant/demoapp/demoapp.sock;
    }
}
```

## link para o Nginx

```
sudo ln -s /etc/nginx/sites-available/demoapp /etc/nginx/sites-enabled
```

### Testando a nginx syntax

```
sudo nginx -t
```

Resultado:
```
nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
nginx: configuration file /etc/nginx/nginx.conf test is successful
```

## restart nginx

```
sudo systemctl restart nginx
```

## Acertando firewall, removendo port 5000

```
sudo ufw delete allow 5000
sudo ufw allow 'Nginx Full'
```

## Instalando packetbeat no servidor do nginx

```
sudo apt-get install libpcap0.8
curl -L -O https://artifacts.elastic.co/downloads/beats/packetbeat/packetbeat-7.2.0-amd64.deb
sudo dpkg -i packetbeat-7.2.0-amd64.deb
```

Seguir os procedimentos: https://www.elastic.co/guide/en/beats/packetbeat/current/packetbeat-configuration.html



