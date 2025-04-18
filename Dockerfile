FROM openjdk:8-jdk

ENV JVM_XMX=2048M
ENV JVM_XMS=1024M
ENV SERVER_JAR=forge_server.jar

#RUN apt-get update && \
#    apt-get install -y rsync && \
#    apt-get clean && \
#    rm -rf /var/lib/apt/lists/*

WORKDIR /tmp/minecraft

COPY ./image_files/forge*.jar /tmp/minecraft/forge-installer.jar

COPY ./image_files/server-icon.png /tmp/minecraft/server-icon.png

COPY ./image_files/prepare.sh /tmp/prepare.sh
COPY ./image_files/init.sh /tmp/init.sh

RUN chmod +x /tmp/*.sh

RUN /tmp/prepare.sh

WORKDIR /minecraft

EXPOSE 25565

#ENTRYPOINT java -Xmx${JVM_XMX} -Xms${JVM_XMS} -jar ${SERVER_JAR} nogui

CMD java -Djava.awt.headless=true -Xmx${JVM_XMX} -Xms${JVM_XMS} -jar ${SERVER_JAR} nogui
