.PHONY: build test all deploy

CURRENT_GIT_BRANCH=$(shell git rev-parse --abbrev-ref HEAD)

all: build test deploy

build:
	docker-compose build oscap4docker

test:
	docker-compose up --build oscap4docker-test

deploy:
	@bash ./deploy.sh
