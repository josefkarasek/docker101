FROM fedora:23
MAINTAINER "Peter Schiffer" <pschiffe@redhat.com>

RUN dnf -y --setopt=tsflags=nodocs install \
        gcc \
    && dnf -y clean all

WORKDIR /gcc
