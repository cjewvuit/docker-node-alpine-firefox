FROM node:gallium-alpine
LABEL maintainer "Charlie Edwards <cjewvuit@gmail.com>"

ARG REFRESHED_AT
ENV REFRESHED_AT $REFRESHED_AT

RUN echo @edge https://dl-cdn.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories \
  && echo @edge https://dl-cdn.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories \
  && echo @edge https://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories  \
  && apk -U upgrade \
  && apk add --no-cache \
    firefox@edge \
    freetype@edge \
    ttf-freefont@edge \
    nss@edge \
    libstdc++@edge \
    sqlite-libs@edge \
    chromium@edge \
    harfbuzz@edge \
    wayland-libs-client@edge \
    wayland-libs-server@edge \
    wayland-libs-cursor@edge \
    wayland-libs-egl@edge \
    wayland@edge

RUN adduser -D foo
USER foo

