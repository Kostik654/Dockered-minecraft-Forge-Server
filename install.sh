#!/bin/bash

set -e

# https://files.minecraftforge.net/net/minecraftforge/forge/
FVERSION="1.21.5-55.0.9"

# https://hub.docker.com/
JDK_V="eclipse-temurin:21-jdk"

# CONST
FNAME="forge_server.jar"

IMAGE_NAME="mcsrv:f${FVERSION}"
CONTAINER_NAME="mc-srv-Forge-${FVERSION}"

XMX_=2048M
XMS_=1024M

MOUNT_DIR=./minecraft

SERVER_PORT=25565

wget https://maven.minecraftforge.net/net/minecraftforge/forge/${FVERSION}/forge-${FVERSION}-installer.jar -O ./image_files/${FNAME}

cat <<EOF > ./.env
JVM_XMX=${XMX_}
JVM_XMS=${XMS_}
IMG_NAME=${IMAGE_NAME}
CONT_NAME=${CONTAINER_NAME}
SRV_PORT=${SERVER_PORT}
MNT_DIR=${MOUNT_DIR}
SERVER_JAR=${FNAME}
JV=${JDK_V}
EOF

# /usr/bin/docker build --no-cache -t $IMAGE_NAME .

/usr/bin/docker compose up -d --build

/usr/bin/docker attach $CONTAINER_NAME

# enter <stop> command after the World creation

/usr/bin/docker restart $CONTAINER_NAME

/usr/bin/docker attach $CONTAINER_NAME

exit
