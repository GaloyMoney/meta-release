FROM python:alpine

RUN apk update \
  && apk add bash curl wget tar git gettext \
  && apk add yq --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community

ARG GIT_CLIFF_VERSION=0.5.0
RUN wget https://github.com/orhun/git-cliff/releases/download/v${GIT_CLIFF_VERSION}/git-cliff-${GIT_CLIFF_VERSION}-x86_64-unknown-linux-musl.tar.gz \
  && tar -zxvf git-cliff-${GIT_CLIFF_VERSION}-x86_64-unknown-linux-musl.tar.gz \
  && mv git-cliff-${GIT_CLIFF_VERSION}/git-cliff /usr/local/bin \
  && chmod +x /usr/local/bin/git-cliff \
  && rm -rf ./git-cliff-*

RUN pip install --upgrade bump2version
