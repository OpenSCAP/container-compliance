.PHONY: build test all

DOCKER_IMAGE_NAME=dduportal/oscap4docker

all: build test

build:
	docker build --tag $(DOCKER_IMAGE_NAME) .

test:
	docker run \
		--rm \
		-v $(CURDIR):/app \
		-v $$(which docker):$$(which docker) \
		-v /var/run/docker.sock:/var/run/docker.sock \
		-e DOCKER_HOST=unix:///var/run/docker.sock \
		-e DOCKER_IMAGE_NAME=$(DOCKER_IMAGE_NAME) \
		dduportal/bats:0.4.0 \
			/app/tests/bats/
