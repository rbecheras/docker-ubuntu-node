IMAGE_NAME=ubuntu-node
IMAGE_TAG=lastbuild
CONTAINER_NAME=$(IMAGE_NAME)

all: build

build:
	docker build -t $(IMAGE_NAME):$(IMAGE_TAG) .

run:
	docker run -it --rm --name $(CONTAINER_NAME) $(IMAGE_NAME):$(IMAGE_TAG) bash

.PHONY: build run