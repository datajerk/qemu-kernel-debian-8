FROM armv7/armhf-debian:latest

ENV LC_ALL C
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

MAINTAINER <datajerk@gmail.com>

RUN apt-get update 

RUN apt-get -y install wget xz-utils fakeroot kernel-package

RUN echo "CONCURRENCY_LEVEL= 5" >> /etc/kernel-pkg.conf

WORKDIR /tmp

RUN wget https://www.kernel.org/pub/linux/kernel/v3.x/linux-3.18.21.tar.xz

RUN tar xvf linux-3.18.21.tar.xz 

WORKDIR linux-3.18.21

COPY v-1.2.config .config

RUN make olddefconfig

RUN make-kpkg clean

RUN fakeroot make-kpkg --initrd --revision=1.0.qemu kernel_image

