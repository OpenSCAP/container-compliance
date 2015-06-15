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
	&& wget --quiet -O /usr/local/bin/docker-oscap \
		"https://raw.githubusercontent.com/OpenSCAP/container-compliance/${DOCKER_OSCAP_VERSION}/docker-oscap" \
	&& chmod a+x /usr/local/bin/docker-oscap

WORKDIR /data
VOLUME ["/data"]

ENTRYPOINT ["/usr/local/bin/docker-oscap"]
CMD ["help"]
