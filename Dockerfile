FROM ubuntu

ENV GO_VERSION=1.17

RUN sudo apt-get upgrade

RUN sudo apt-get -y git curl

## install golang
## https://golang.org/doc/install
RUN curl -o /usr/local/go.linux-amd64.tar.gz https://golang.org/dl/go${GO_VERSION}.linux-amd64.tar.gz
# This step will remove a previous installation at /usr/local/go, if any, prior to extracting. Please back up any data before proceeding.
RUN rm -rf /usr/local/go && tar -C /usr/local -xzf go.linux-amd64.tar.gz
RUN export PATH=$PATH:/usr/local/go/bin
RUN go version

## create workspace
RUN mkdir ~/alunir
WORKDIR ~/alunir
