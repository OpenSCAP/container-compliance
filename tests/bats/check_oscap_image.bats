#!/usr/bin/env bats

CENTOS_VERSION=7
@test "We use the Centos linux version ${CENTOS_VERSION}" {
 	local FOUND_CENTOS_VERSION=$(docker run --entrypoint sh "${DOCKER_IMAGE_NAME}" -c "grep VERSION_ID /etc/os-release")
	[ "${FOUND_CENTOS_VERSION}" == "VERSION_ID=\"${CENTOS_VERSION}\"" ]
}

@test "Wget is installed" {
	docker run --entrypoint sh "${DOCKER_IMAGE_NAME}" -c "which wget"
}

OSCAP_VERSION=1.1.1
@test "OSCAP is installed and in version ${OSCAP_VERSION}" {
	docker run --entrypoint sh "${DOCKER_IMAGE_NAME}" -c "which oscap"
	local FOUND_OSCAP_VERSION=$(docker run --entrypoint /usr/bin/oscap dduportal/oscap4docker --version \
		| head -n1 | awk '{print $6}')
	[ "${FOUND_OSCAP_VERSION}" == "${OSCAP_VERSION}" ]
}

@test "oscap-docker script is installed and available in the Path" {
	docker run --entrypoint sh "${DOCKER_IMAGE_NAME}" -c "which oscap-docker"
}

WORKDIR_PATH="/data"
@test "We are in ${WORKDIR_PATH} by default, and this is a data volume" {
	[ "$(docker run --entrypoint pwd ${DOCKER_IMAGE_NAME})" == "${WORKDIR_PATH}" ]
	local CID=$(docker run -d "${DOCKER_IMAGE_NAME}")
	[ $(docker inspect -f '{{ index .Volumes "/data"}}' "${CID}" | wc -l) -eq 1 ]
}


