#!/usr/bin/env bats

CENTOS_VERSION=7
@test "We use the Centos linux version ${CENTOS_VERSION}" {
 	[ $(docker run --entrypoint sh "${DOCKER_IMAGE_NAME}" -c "grep VERSION_ID /etc/os-release | grep -e \"=${CENTOS_VERSION}\" | wc -l") -eq 1 ]
}

@test "Bash is installed" {
	docker run --entrypoint sh "${DOCKER_IMAGE_NAME}" -c "which bash"
}

@test "OpenSSL is installed" {
	docker run --entrypoint sh "${DOCKER_IMAGE_NAME}" -c "which openssl"
}

@test "Curl is installed" {
	docker run --entrypoint sh "${DOCKER_IMAGE_NAME}" -c "which curl"
}
