#!/bin/bash
cd /home/container

## download and install steamcmd
mkdir /home/container/steamcmd
curl -SL -o steamcmd.tar.gz "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz"
tar -xzvf steamcmd.tar.gz -C /home/container/steamcmd
rm /home/container/steamcmd.tar.gz

# install steamm app with steamcmd
./steamcmd/steamcmd.sh +login "${STEAM_USERNAME}" "${STEAM_PASSWORD}" "${STEAM_AUTH}" +@sSteamCmdForcePlatformType "windows" +force_install_dir /home/container/app +app_update 6020 +quit

# download and install OpenJK
curl -SL -o openjk.tar.gz "https://builds.openjk.org/openjk-2018-02-26-e3f22070-linux-64.tar.gz"
tar -xzvf openjk.tar.gz -C "/home/container"
cp -r /home/container/install/JediAcademy/* /home/container/app/GameData
rm -r /home/container/install
rm /home/container/openjk.tar.gz

# change directory
cd /home/container/app/GameData

# run the Server
./openjkded.x86_64 $ARGS
