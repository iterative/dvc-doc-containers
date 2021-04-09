FROM ubuntu:20.04

WORKDIR /root

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

ARG RELEASE_HASH
RUN RELEASE_HASH=${RELEASE_HASH} \
    apt-get update -y && apt-get install -y \
                         gnupg \
                         wget \
                         tree

RUN wget \
       https://dvc.org/deb/dvc.list \
       -O /etc/apt/sources.list.d/dvc.list

RUN wget -qO - https://dvc.org/deb/iterative.asc | apt-key add -

RUN RELEASE_HASH=${RELEASE_HASH} \
    apt-get update -y && apt-get install -y \
                                 dvc 

COPY bashrc .bashrc

# Configure git user name and email
RUN git config --global user.email "guest@example.com" \
    && git config --global user.name "Guest User"

CMD ["/bin/bash", "-i"]





