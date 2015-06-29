FROM centos:centos7
MAINTAINER Damien DUPORTAL <damien.duportal@gmail.com>

# Since the project is not versionned on Github
ENV DOCKER_OSCAP_VERSION master
RUN yum install -y \
		openssl \
		openscap \
		openscap-utils \
		openscap-engine-sce \
		wget \
	&& wget --quiet -O /usr/local/bin/oscap-docker \
		"https://raw.githubusercontent.com/OpenSCAP/container-compliance/${DOCKER_OSCAP_VERSION}/oscap-docker" \
	&& chmod a+x /usr/local/bin/oscap-docker

WORKDIR /data
VOLUME ["/data"]

ENTRYPOINT ["/usr/local/bin/oscap-docker"]
CMD ["help"]
