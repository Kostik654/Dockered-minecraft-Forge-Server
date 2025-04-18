#!/bin/sh

echo "Starting Forge installation..."

# First launch
echo "eula=true" > eula.txt
java -jar forge-installer.jar --installServer

rm forge-installer.jar

mv forge-*.jar forge_server.jar

echo "Preparation complete."
