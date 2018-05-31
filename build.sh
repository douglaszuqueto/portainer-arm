#!/usr/bin/env bash

LATEST_VERSION=$(curl -s https://api.github.com/repos/portainer/portainer/releases/latest | python -c "import sys, json; print json.load(sys.stdin)['tag_name']")

echo "Versão: $LATEST_VERSION"

wget https://github.com/portainer/portainer/releases/download/$LATEST_VERSION/portainer-$LATEST_VERSION-linux-arm.tar.gz -O portainer.tar.gz

tar -xvzf portainer.tar.gz

docker build -t douglaszuqueto/portainer:raspberry-$LATEST_VERSION .
docker build -t douglaszuqueto/portainer:latest .

docker push douglaszuqueto/portainer:raspberry-$LATEST_VERSION
docker push douglaszuqueto/portainer:latest

rm -rf portainer portainer.tar.gz

echo $LATEST_VERSION > version
