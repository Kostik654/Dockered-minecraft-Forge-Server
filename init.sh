#!/bin/sh

MOUNTED_DIR=/minecraft
SRC_DIR=/tmp/minecraft

cp -rn /tmp/minecraft/* $MOUNTED_DIR/

# rsync -av --ignore-existing $SRC_DIR/* $MOUNTED_DIR/

rm -rf $SRC_DIR

cd $MOUNTED_DIR

# DO NOT TOUCH
sed -i 's/^server-ip=.*/server-ip=/' server.properties

# ONLINE MODE DISABLE
sed -i 's/^online-mode=.*/online-mode=false/' server.properties

# WHITE LIST
sed -i 's/^white-list=.*/white-list=true/' server.properties

# Запуск сервера
exec java -Djava.awt.headless=true -Xmx${JVM_XMX} -Xms${JVM_XMS} -jar ${SERVER_JAR} nogui
