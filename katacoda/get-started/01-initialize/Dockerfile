FROM dvcorg/katacoda-base:latest


RUN git clone https://github.com/iterative/example-get-started --branch 0-git-init

WORKDIR /root/example-get-started
COPY start.sh /root/start.sh

CMD ["/bin/bash", "-i"]

