.PHONY: build test all

all: build test

build:
	docker-compose build oscap4docker

test:
	docker-compose up --build oscap4docker-test
