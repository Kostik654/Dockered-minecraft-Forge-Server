#!/bin/bash

set -e

IMAGE_NAME="mcsrv:fX.X.X"
CONTAINER_NAME="mc-srv-Forge-X.X.X"

XMX_=2048M
XMS_=1024M

MOUNT_DIR=./minecraft

SERVER_PORT=25565

# EXAMPLE
# wget https://maven.minecraftforge.net/net/minecraftforge/forge/1.12.2-14.23.5.2859/forge-1.12.2-14.23.5.2859-installer.jar -O forge-1.12.2-installer.jar

cat <<EOF > ./.env
JVM_XMX=${XMX_}
JVM_XMS=${XMS_}
IMG_NAME=${IMAGE_NAME}
CONT_NAME=${CONTAINER_NAME}
SRV_PORT=${SERVER_PORT}
MNT_DIR=${MOUNT_DIR}
SERVER_JAR=forge_server.jar
EOF

# /usr/bin/docker build --no-cache -t $IMAGE_NAME .

/usr/bin/docker compose up -d --build

/usr/bin/docker attach $CONTAINER_NAME

/usr/bin/docker restart $CONTAINER_NAME

/usr/bin/docker attach $CONTAINER_NAME

exit
