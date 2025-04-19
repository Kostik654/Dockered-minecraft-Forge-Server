#!/bin/sh

# CONSTANT VARS
MOUNTED_DIR=/minecraft
SRC_DIR=/server_files/minecraft

cp -rn $SRC_DIR/* $MOUNTED_DIR/

# rsync -av --ignore-existing $SRC_DIR/* $MOUNTED_DIR/

rm -rf $SRC_DIR

cd $MOUNTED_DIR

# DO NOT TOUCH
sed -i 's/^server-ip=.*/server-ip=/' server.properties

# ONLINE MODE AUTO DISABLE
sed -i 's/^online-mode=.*/online-mode=false/' server.properties

# WHITE LIST AUTO ENABLE
sed -i 's/^white-list=.*/white-list=true/' server.properties

# Start server
exec java -Djava.awt.headless=true -Xmx${JVM_XMX} -Xms${JVM_XMS} -jar ${SERVER_JAR} nogui
