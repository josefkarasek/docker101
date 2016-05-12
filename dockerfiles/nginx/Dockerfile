FROM nginx:stable-alpine
MAINTAINER "Peter Schiffer" <pschiffe@redhat.com>

LABEL RUN="docker run -d -p 80:80 --restart always --name NAME IMAGE"

RUN apk add --update git && rm -rf /var/cache/apk/*

RUN rm -rf /usr/share/nginx/html/* && git clone -b gh-pages https://github.com/josefkarasek/docker101.git /usr/share/nginx/html/
