# Dockered Minecraft Forge Server
A simple solution for quick deployment of Minecraft Forge Server on Linux


------------


### INSTALLATION
------------

1. In the file **install.sh** edit the variables according to your requirements:
```
IMAGE_NAME="mcsrv:fX.X.X"
# https://files.minecraftforge.net/net/minecraftforge/forge/
FVERSION="1.21.5-55.0.9"
# https://hub.docker.com/
JDK_V="eclipse-temurin:21-jdk"
IMAGE_NAME="mcsrv:f${FVERSION}"
CONTAINER_NAME="mc-srv-Forge-${FVERSION}"
# MAX RAM
XMX_=2048M
# MIN RAM
XMS_=1024M
# Folder for storing container files
MOUNT_DIR=./minecraft
# The server port for the external connections
SERVER_PORT=25565
```

2. You can pre-place any custom server files (world, mods, server.properties, etc.) in the directory **./minecraft** (or any other directory specified in the $MOUNT_DIR variable in the file **install.sh**)
They will not be affected when the server is started.

3. In the file **./image_files/init.sh** you can comment or edit the following lines if necessary:
```
# ONLINE MODE AUTO DISABLE
sed -i 's/^online-mode=.*/online-mode=false/' server.properties
# WHITE LIST AUTO ENABLE
sed -i 's/^white-list=.*/white-list=true/' server.properties
```

4. Run the file **install.sh** preferably on behalf of the superuser. Immediately after launch, the image will be built and launched via docker compose. Next, the terminal will be connected to the main process inside the container, the I/O stream of the minecraft server. it is necessary to write **stop** in the server console immediately after the end of its launch. It will then be automatically restarted.

5. The server is now running successfully.
You can disconnect from viewing the container by using **Ctrl + P** and then **Ctrl + Q**

6. In the future, you can connect back to the container to manage the server using the command:
```
docker attach <container_name>
```
