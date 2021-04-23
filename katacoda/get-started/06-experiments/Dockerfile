FROM dvcorg/doc-katacoda:base

ARG RELEASE_HASH
RUN RELEASE_HASH=${RELEASE_HASH} \
    git clone \
    https://github.com/iterative/dvc-get-started-mnist /root/example-get-started/ \
    && git -C /root/example-get-started checkout -b katacoda-project


WORKDIR /root/example-get-started

RUN RELEASE_HASH=${RELEASE_HASH} \
    apt-get update -y \
    && apt-get install -y \
               python3 \
               python3-pip \
               python-is-python3 \
    && pip3 install -r requirements.txt


# RUN RELEASE_HASH=${RELEASE_HASH} \
#     dvc pull 

COPY start.sh /root/start.sh

EXPOSE 80

CMD ["/bin/bash", "-i"]

