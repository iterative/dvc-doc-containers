FROM emresult/dvc-katacoda-base:latest

RUN git clone https://github.com/iterative/example-get-started --branch 1-dvc-init && git -C /root/example-get-started/ checkout -b katacoda-changes

COPY start.sh /root/start.sh

WORKDIR /root/example-get-started

CMD ["/bin/bash", "-i"]

