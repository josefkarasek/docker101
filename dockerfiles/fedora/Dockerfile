FROM fedora:23
MAINTAINER "Peter Schiffer" <pschiffe@redhat.com>

RUN dnf -y --setopt=tsflags=nodocs install \
        hostname \
        iproute \
        procps-ng \
        stress \
    && dnf -y clean all
