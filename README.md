# Dockered Minecraft Forge Server
A simple solution for quick deployment of Minecraft Forge Server on Linux


------------


### INSTALLATION
------------

1. Download the Forge server installation **jar** file and place it in the ./image_files/ folder of this project. For example:
```
wget https://maven.minecraftforge.net/net/minecraftforge/forge/1.12.2-14.23.5.2859/forge-1.12.2-14.23.5.2859-installer.jar -O ./image_files/forge-1.12.2-installer.jar
```
The file name must match the [forge*.jar] template.

2. In the file **install.sh** edit the variables according to your requirements:
```
IMAGE_NAME="mcsrv:fX.X.X"
# https://files.minecraftforge.net/net/minecraftforge/forge/
FVERSION="1.21.5-55.0.9"
# https://hub.docker.com/
JDK_V="eclipse-temurin:21-jdk"
IMAGE_NAME="mcsrv:f${FVERSION}"
CONTAINER_NAME="mc-srv-Forge-${FVERSION}"
XMX_=2048M
XMS_=1024M
# Folder for storing container files
MOUNT_DIR=./minecraft
# The server port for the external connections
SERVER_PORT=25565
```

3. You can pre-place any custom server files (world, mods, server.properties, etc.) in the directory **./minecraft** (or any other directory specified in the $MOUNT_DIR variable in the file **install.sh**)
They will not be affected when the server is started.

4. In the file **./image_files/init.sh** you can comment or edit the following lines if necessary:
```
# ONLINE MODE AUTO DISABLE
sed -i 's/^online-mode=.*/online-mode=false/' server.properties
# WHITE LIST AUTO ENABLE
sed -i 's/^white-list=.*/white-list=true/' server.properties
```

5. Run the file **install.sh** preferably on behalf of the superuser. Immediately after launch, the image will be built and launched via docker compose. Next, the terminal will be connected to the main process inside the container, the I/O stream of the minecraft server. it is necessary to write **stop** in the server console immediately after the end of its launch. It will then be automatically restarted.

6. The server is now running successfully.
You can disconnect from viewing the container by using **Ctrl + P** and then **Ctrl + Q**

7. In the future, you can connect back to the container to manage the server using the command:
```
docker attach <container_name>
```
