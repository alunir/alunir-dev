FROM ubuntu

ENV GO_VERSION=1.17

ENV GO111MODULE=on
ENV GOPROXY=direct
ENV GOPRIVATE=github.com/alunir

RUN apt-get update

RUN apt-get install -y git wget

## install golang
## https://golang.org/doc/install
RUN cd /usr/local
RUN wget https://golang.org/dl/go${GO_VERSION}.linux-amd64.tar.gz
# This step will remove a previous installation at /usr/local/go, if any, prior to extracting. Please back up any data before proceeding.
RUN rm -rf /usr/local/go && tar -C /usr/local -xzf go${GO_VERSION}.linux-amd64.tar.gz
ENV PATH=$PATH:/usr/local/go/bin
RUN go version

## create workspace
RUN mkdir -p /home/root/alunir
WORKDIR /home/root/alunir
