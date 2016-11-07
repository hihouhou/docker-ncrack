#
# Ncrack Dockerfile
#
# https://github.com/
#

# Pull base image.
FROM debian:latest

MAINTAINER hihouhou < hihouhou@hihouhou.com >

ENV NCRACK_VERSION 0.5

#Update & install packages for installting add-apt-repository
RUN apt-get update && \
    apt-get install -y wget build-essential libssl-dev

# Update & install packages for installing ethereum
RUN wget https://nmap.org/ncrack/dist/ncrack-${NCRACK_VERSION}.tar.gz && \
    tar -xzf ncrack-${NCRACK_VERSION}.tar.gz && \
    cd ncrack-${NCRACK_VERSION} && \
    ./configure && \
    make && \
    make install
    

CMD ["/bin/bash"]
