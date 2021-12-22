#!/bin/bash

# Download grafana
sudo apt-get install -y gnupg2 curl software-properties-common
curl https://packages.grafana.com/gpg.key | sudo apt-key add -
sudo add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"

# Install grafana
sudo apt update -y
sudo apt install grafana

# systemd
sudo systemctl daemon-reload
sudo systemctl enable grafana-server
sudo systemctl start grafana-server



