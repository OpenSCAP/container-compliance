.PHONY: build test all

all: build test

build:
	docker-compose build oscap4docker

test: build
	docker-compose up --build oscap4docker-test
