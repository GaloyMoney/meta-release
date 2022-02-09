FROM python:alpine

RUN apk update \
  && apk add bash curl wget tar git gettext jq \
  && apk add yq --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community

ARG GIT_CLIFF_VERSION=0.5.0
RUN wget https://github.com/orhun/git-cliff/releases/download/v${GIT_CLIFF_VERSION}/git-cliff-${GIT_CLIFF_VERSION}-x86_64-unknown-linux-musl.tar.gz \
  && tar -zxvf git-cliff-${GIT_CLIFF_VERSION}-x86_64-unknown-linux-musl.tar.gz \
  && mv git-cliff-${GIT_CLIFF_VERSION}/git-cliff /usr/local/bin \
  && chmod +x /usr/local/bin/git-cliff \
  && rm -rf ./git-cliff-*

ARG HELM_VERSION=3.8.0
RUN wget https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz \
  && tar -zxvf helm-v${HELM_VERSION}-linux-amd64.tar.gz \
  && mv linux-amd64/helm /usr/local/bin \
  && chmod +x /usr/local/bin/helm \
  && rm -rf linux-amd64 helm-*

ARG CR_VERSION=1.3.0
RUN wget https://github.com/helm/chart-releaser/releases/download/v${CR_VERSION}/chart-releaser_${CR_VERSION}_linux_amd64.tar.gz \
  && tar -zxvf chart-releaser_${CR_VERSION}_linux_amd64.tar.gz \
  && mv cr /usr/local/bin \
  && chmod +x /usr/local/bin/cr \
  && rm LICENSE README.md

# Cache repository, used frequently during chart releasing
RUN helm repo add bitnami https://charts.bitnami.com/bitnami

# Setup Committer information
RUN git config --global user.email "bot@galoy.io" \
  && git config --global user.name "CI Bot"

RUN pip install --upgrade bump2version
