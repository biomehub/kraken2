FROM debian:latest
MAINTAINER lfelipedeoliveira, felipe@lfelipedeoliveira.com

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y; \
    apt-get install -y apt-utils

RUN apt-get install -y wget; \
    apt-get install -y git; \
    apt-get install -y zlib1g-dev; \
    apt-get install -y pkg-config libfreetype6-dev libpng-dev python-matplotlib; \
    apt-get install -y python-pip; \
    apt-get update; \
    apt-get clean

# Download & install Kraken2

RUN git clone https://github.com/DerrickWood/kraken2.git \
    && mkdir /opt/kraken2  \
    && cd kraken2  \
    && sh install_kraken2.sh /opt/kraken2 \
    && cd .. \
    && rm -r kraken2

ENV PATH /opt/kraken2/:$PATH
