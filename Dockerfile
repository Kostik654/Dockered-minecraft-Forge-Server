FROM openjdk:8-jdk

ARG JVM_XMX_=2048M
ARG JVM_XMS_=1024M
ARG SERVER_JAR_=forge_server.jar

ENV JVM_XMX=${JVM_XMX_}
ENV JVM_XMS=${JVM_XMS_}
ENV SERVER_JAR=${SERVER_JAR_}

#RUN apt-get update && \
#    apt-get install -y rsync && \
#    apt-get clean && \
#    rm -rf /var/lib/apt/lists/*

WORKDIR /server_files/minecraft

COPY ./image_files/forge*.jar /server_files/minecraft/forge-installer.jar

COPY ./image_files/server-icon.png /server_files/minecraft/server-icon.png

COPY ./image_files/prepare.sh /server_files/prepare.sh
COPY ./image_files/init.sh /server_files/init.sh

RUN chmod +x /server_files/*.sh

RUN /server_files/prepare.sh

WORKDIR /minecraft

EXPOSE 25565

#ENTRYPOINT java -Xmx${JVM_XMX} -Xms${JVM_XMS} -jar ${SERVER_JAR} nogui

CMD java -Djava.awt.headless=true -Xmx${JVM_XMX} -Xms${JVM_XMS} -jar ${SERVER_JAR} nogui
