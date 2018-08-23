all: build

build:
	docker build -t ubuntu-node:lastbuild .

.PHONY: build