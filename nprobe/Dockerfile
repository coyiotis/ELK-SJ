FROM ubuntu:18.04
MAINTAINER coyiotis

RUN apt-get update && \
    apt-get -y -q install wget lsb-release gnupg && \
    wget -q http://apt-stable.ntop.org/18.04/all/apt-ntop-stable.deb && \
    dpkg -i apt-ntop-stable.deb && \
    apt-get clean all

RUN apt-get update && \
    apt-get -y install pfring
	
RUN apt-get --reinstall install libc-bin

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y tshark
RUN yes yes | DEBIAN_FRONTEND=teletype dpkg-reconfigure wireshark-common
RUN apt-get install -y fakeroot tcpreplay
RUN apt-get install -y libdnet
RUN apt-get install -y iputils-ping jq

RUN apt-get -y install nprobe; exit 0

RUN echo '#!/bin/bash\nnprobe "$@"' > /run.sh && \
    chmod +x /run.sh

RUN mkdir /data
RUN mkdir -p /etc/nprobe