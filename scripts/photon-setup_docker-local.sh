#!/bin/bash

# Enable docker daemon on boot
systemctl enable docker

# install docker compose
curl -L 192.168.254.1:8081/artifactory/docker-compose/docker-compose > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose