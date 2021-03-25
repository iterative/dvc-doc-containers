FROM emresult/dvc-katacoda-base:latest

RUN apt-get update -y && apt-get install -y \
                         python3 \
                         python3-pip

RUN git clone https://github.com/iterative/example-get-started --branch 6-prepare-stage && git -C /root/example-get-started checkout -b katacoda-project

WORKDIR /root/example-get-started
RUN dvc update

COPY start.sh /root/start.sh

EXPOSE 80

CMD ["/bin/bash", "-i"]

