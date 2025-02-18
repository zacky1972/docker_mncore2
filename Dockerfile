FROM --platform=linux/amd64 ubuntu:22.04 AS build_amd64

ENV DEBIAN_FRONTEND=noninteractive
RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
RUN \
  apt-get update && \
  apt-get upgrade -y && \
  apt-get -y install libgomp1 curl tar xz-utils && \
  apt-get autoclean && \
  apt-get autoremove && \
  apt-get -y clean && \
  rm -rf /var/lib/apt/lists/*
ENV MNCORE2_EMUENV_VERSION=20240826
RUN mkdir -p /usr/local/mncore2_emuenv
RUN curl -SL --output - https://projects.preferred.jp/mn-core/assets/mncore2_emuenv_$MNCORE2_EMUENV_VERSION.tar.xz | tar xJ -C /usr/local/mncore2_emuenv --strip-components 1
ENV PATH=/usr/local/mncore2_emuenv:$PATH
