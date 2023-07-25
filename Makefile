.PHONY: help all build-js build start start-background stop reset-db migrate logs manage

include .env

help:              ## Show this help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

build:              ## Build image based on docker-compose.yml file
	docker-compose -f docker-compose.yml build
	docker container prune -f
	docker image prune -f
	docker volume prune -f
	docker-compose -f docker-compose.yml down

start:              ## Run container with services declared in the docker-compose.yml file
	docker-compose -f docker-compose.yml up

start-background:   ## Start containers in detached mode
	docker-compose -f docker-compose.yml up -d

stop:
	docker-compose -f docker-compose.yml down

shell: start-background
	docker-compose -f docker-compose.yml exec dev-server /bin/bash
