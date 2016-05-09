#!/bin/bash

PUBLIC_PORT=8080
MOUNT_DESTINATION=/data/web/getsimple
CONTAINER_NAME=getsimple


TMPFILE=`mktemp`
mkdir -p ${MOUNT_DESTINATION}
wget -O- http://get-simple.info/latest > ${TMPFILE}
pushd ${MOUNT_DESTINATION}
unzip ${TMPFILE}
GETSIMPLE_DIR=$(dirname $(readlink -f ./*/*/readme.txt))
mv ${GETSIMPLE_DIR}/* .
rm -rf GetSimple-*

popd

docker build -t tobiassoltermann/getsimple-docker .

docker run -d -p ${PUBLIC_PORT}:80 -v ${MOUNT_DESTINATION}:/var/www/html --name ${CONTAINER_NAME} tobiassoltermann/getsimple-docker
