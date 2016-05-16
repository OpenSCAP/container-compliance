FROM centos:7
MAINTAINER Damien DUPORTAL <damien.duportal@gmail.com>

RUN yum install -y \
	openssl \
	openscap \
	openscap-utils \
	openscap-engine-sce \
	wget \
	which

ADD ./oscap-docker /usr/local/bin/oscap-docker

WORKDIR /data
VOLUME ["/data"]

ENTRYPOINT ["/bin/bash","/usr/local/bin/oscap-docker"]
CMD ["help"]
