#!/bin/bash
git clone https://github.com/Dofamin/AdGuardHome-Docker.git /srv/AdGuardHome/

docker build . --tag adguard-home

docker rm -f AdGuard-Home

docker create \
  --name=AdGuard-Home\
  -p 3002:3002/tcp \
  -p 3002:3002/udp \
  -p $(hostname -I | awk '{print $1}'):53:53/tcp \
  -p $(hostname -I | awk '{print $1}'):53:53/udp \
  -v /srv/AdGuardHome/container-image-root/data/:/srv/AdGuardHome/data/\
  -v /srv/AdGuardHome/container-image-root/:/srv/AdGuardHome/work/\
  --memory="100m" \
  adguard-home:latest
  
docker start AdGuard-Home