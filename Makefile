.PHONY: build test all deploy

CURRENT_GIT_BRANCH=$(shell git rev-parse --abbrev-ref HEAD)

all: build test deploy

build:
	docker-compose build oscap4docker

test: build
	docker-compose up --build oscap4docker-test

deploy: test
	@if [ "$$TRAVIS_PULL_REQUEST" == "false" ]; then \
		curl -H "Content-Type: application/json" --data '{"source_type": "Branch", "source_name": "$(CURRENT_GIT_BRANCH)"}' \
			-X POST $$DOCKERHUB_AUTOBUILD_URL; \
	fi
