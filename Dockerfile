# FROM alpine:3.7
FROM ubuntu:16.04

RUN mkdir code && apt-get update && apt-get install software-properties-common -y && apt-get install -y git-core && apt-add-repository ppa:swi-prolog/stable && apt-get update -y && apt-get install -y swi-prolog

WORKDIR /code

ADD . /code/

ENTRYPOINT /bin/bash