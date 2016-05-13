FROM nginx:stable-alpine
MAINTAINER "Peter Schiffer" <pschiffe@redhat.com>

LABEL Vendor="docker101"
LABEL Name="docker101-nginx"
LABEL Version="1.10"
LABEL Release="1"
LABEL Architecture="x86_64"

LABEL INSTALL="docker run --rm --privileged -v /:/host -e HOST=/host -e NAME=NAME -e IMAGE=IMAGE IMAGE /bin/install.sh"
LABEL UNINSTALL="docker run --rm --privileged -v /:/host -e HOST=/host -e NAME=NAME -e IMAGE=IMAGE IMAGE /bin/uninstall.sh"
LABEL RUN="docker run -d -p 80:80 --restart always --name NAME IMAGE"

COPY nginx.service /etc/nginx.service.template
COPY install.sh uninstall.sh /bin/

RUN apk add --update git && rm -rf /var/cache/apk/*

RUN rm -rf /usr/share/nginx/html/* && git clone -b gh-pages https://github.com/pschiffe/docker101.git /usr/share/nginx/html/
