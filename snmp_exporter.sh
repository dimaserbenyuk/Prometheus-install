#!/bin/bash

# Make directories and dummy files necessary for snmp_exporter
sudo mkdir /etc/snmp_exporter

wget https://github.com/prometheus/snmp_exporter/releases/download/v0.20.0/snmp_exporter-0.20.0.linux-amd64.tar.gz
tar xzf snmp_exporter-0.20.0.linux-amd64.tar.gz

sudo cp snmp_exporter-0.20.0.linux-amd64/snmp_exporter /usr/local/bin/
sudo cp snmp_exporter-0.20.0.linux-amd64/snmp.yml /etc/snmp_exporter/

# Populate configuration files
cat ./snmp_exporter/snmp_exporter.service | sudo tee /etc/systemd/system/snmp_exporter.service

# systemd
sudo systemctl daemon-reload
sudo systemctl enable snmp_exporter.service
sudo systemctl start snmp_exporter.service

# Installation cleanup
rm snmp_exporter-0.20.0.linux-amd64.tar.gz
rm -rf snmp_exporter-0.20.0.linux-amd64