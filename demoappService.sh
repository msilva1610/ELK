# demoapp.service ##########################################################################
echo -e "-- Gerando demoapp.service...\n"
sudo cat > /etc/systemd/system/demoapp.service <<EOD
[Unit]
Description=Redis In-Memory Data Store
After=network.target
[Service]
User=redis
Group=redis
ExecStart=/usr/local/bin/redis-server /etc/redis/redis.conf
ExecStop=/usr/local/bin/redis-cli shutdown
Restart=always
[Install]
WantedBy=multi-user.target
EOD
# redis.service ##########################################################################
echo -e "-- recarregando as units services...\n"
sudo systemctl daemon-reload