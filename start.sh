#!/bin/bash

/usr/bin/docker build --no-cache -t mcsrv:f1.12.2 .

/usr/bin/docker compose up -d

/usr/bin/docker attach mc-srv-Forge-1.12.2

/usr/bin/docker restart mc-srv-Forge-1.12.2

/usr/bin/docker attach mc-srv-Forge-1.12.2

exit
