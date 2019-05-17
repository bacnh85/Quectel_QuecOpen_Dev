# build image: docker build -t ngohaibac/ubuntu14.04 .
FROM ubuntu:16.04
ARG UID=501
ARG GID=80
ARG UNAME=bacnh

# Update packages
RUN apt-get update && apt-get install -y \
	build-essential libncurses5-dev gawk git libssl-dev gettext zlib1g-dev swig unzip time \
	wget python subversion file \
	intltool quilt vim bc liblzo2-dev tree\ 
# add user tux
	&& useradd -m -u $UID -s /bin/bash $UNAME 

USER $UNAME
WORKDIR /opt
VOLUME ["/opt"]

ENTRYPOINT /bin/bash

CMD ["true"]
