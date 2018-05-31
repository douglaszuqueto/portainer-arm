#!/usr/bin/env bash

VERSION=$(cat version)
LATEST_VERSION=$(curl -s https://api.github.com/repos/portainer/portainer/releases/latest | python -c "import sys, json; print json.load(sys.stdin)['tag_name']")

echo -e "Versão antiga: $VERSION"
echo -e "Versão nova: $LATEST_VERSION\n"

if [ "$VERSION" == "$LATEST_VERSION" ]
then
echo -e "Nenhuma versão para atualizar!\n\n"
echo -e "abortando..."
exit
fi

wget https://github.com/portainer/portainer/releases/download/$LATEST_VERSION/portainer-$LATEST_VERSION-linux-arm.tar.gz -O portainer.tar.gz

tar -xvzf portainer.tar.gz

docker build -t douglaszuqueto/portainer:raspberry-$LATEST_VERSION .
docker build -t douglaszuqueto/portainer:latest .

docker push douglaszuqueto/portainer:raspberry-$LATEST_VERSION
docker push douglaszuqueto/portainer:latest

rm -rf portainer portainer.tar.gz

echo $LATEST_VERSION > version
