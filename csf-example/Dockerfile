FROM fedora:23
MAINTAINER "Peter Schiffer" <pschiffe@redhat.com>

RUN dnf -y --setopt=tsflags=nodocs install \
        wget \
        tar \
        perl \
        perl-Net-SMTP-SSL \
        perl-Math-BigInt \
        perl-GDGraph \
        cronie \
    && dnf -y clean all
