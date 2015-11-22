
VER = v1

default: build

build: Dockerfile
	docker build -t qemu-kernel-debian-8:$(VER) .
	docker tag -f qemu-kernel-debian-8:$(VER) qemu-kernel-debian-8:latest


