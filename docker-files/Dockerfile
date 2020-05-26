FROM ubuntu:16.04

# Docker variables
ARG PUID=1000
ARG PGID=1000

# Update packages
RUN apt-get update && apt-get install -y \
	build-essential libncurses5-dev gawk git libssl-dev gettext zlib1g-dev swig unzip time \
	wget python subversion file cmake\
	intltool quilt vim bc liblzo2-dev tree \ 
	# for AG35
	checkpolicy cryptsetup-bin kmod python3 \
	# Clean up
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /opt
VOLUME [ "/opt" ]

ADD entrypoint.sh /
RUN chmod u+x /entrypoint.sh
ENTRYPOINT ["sh","/entrypoint.sh"]
