FROM        ubuntu:latest

RUN         dpkg --add-architecture i386 \
            && apt update \
            && apt upgrade -y \
            && apt install -y tar curl lib32gcc1 libgcc1 zlib1g:i386 ca-certificates \
            && useradd -m -d /home/container container

USER        container

ENV         HOME /home/container
ENV         ARGS ""
ENV         STEAM_USERNAME "anonymous"
ENV         STEAM_PASSWORD ""
ENV         STEAM_AUTH ""

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/bash", "/entrypoint.sh"]
