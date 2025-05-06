ARG JVM_XMX_=2048M
ARG JVM_XMS_=1024M
ARG SERVER_JAR_=forge_server.jar
ARG JV_=openjdk:8-jdk

FROM ${JV_} AS main

RUN echo "JDK version: ${JV_}"

WORKDIR /server_files/minecraft

COPY ./image_files/forge*.jar /server_files/minecraft/forge-installer.jar

COPY ./image_files/server-icon.png /server_files/minecraft/server-icon.png

COPY ./image_files/prepare.sh /server_files/prepare.sh
COPY ./image_files/init.sh /server_files/init.sh

RUN chmod +x /server_files/*.sh

RUN /server_files/prepare.sh

WORKDIR /minecraft

EXPOSE 25565

# ENTRYPOINT java -Xmx${JVM_XMX_} -Xms${JVM_XMS_} -jar ${SERVER_JAR_} nogui

CMD java -Djava.awt.headless=true -Xmx${JVM_XMX_} -Xms${JVM_XMS_} -jar ${SERVER_JAR_} nogui
