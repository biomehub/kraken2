FROM python:3.11

ENV DEBIAN_FRONTEND noninteractive

LABEL version="2.1.2"
LABEL software.version="2.1.2"
LABEL software="kraken2"
ARG K2VER="2.1.2"

LABEL dockerfile.version="1"
LABEL description="Taxonomic sequence classifier"
LABEL website="https://github.com/DerrickWood/kraken2"
LABEL license="https://github.com/DerrickWood/kraken2/blob/master/LICENSE"

# install dependencies and cleanup apt garbage
RUN apt-get update && apt-get -y install \
 wget \
 ca-certificates \
 build-essential libtool automake zlib1g-dev libbz2-dev pkg-config \
 make \
 g++ \
 rsync \
 cpanminus \
 bash \
 ncbi-blast+

# perl module required for kraken2-build
RUN cpanm Getopt::Std


# DL Kraken2, unpack, and install
RUN wget https://github.com/DerrickWood/kraken2/archive/v${K2VER}.tar.gz && \
 tar -xzf v${K2VER}.tar.gz && \
 rm -rf v${K2VER}.tar.gz && \
 cd kraken2-${K2VER} && \
 ./install_kraken2.sh /usr/local/bin
 
