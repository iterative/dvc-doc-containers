FROM dvcorg/doc-katacoda:base


RUN RELEASE_HASH=${RELEASE_HASH} \
    git clone https://github.com/iterative/example-get-started --branch 0-git-init

WORKDIR /root/example-get-started
COPY start.sh /root/start.sh

CMD ["/bin/bash", "-i"]

