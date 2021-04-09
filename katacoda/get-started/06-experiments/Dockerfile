FROM dvcorg/doc-katacoda:base

ARG RELEASE_HASH
RUN RELEASE_HASH=${RELEASE_HASH} \
    git clone \
    https://github.com/iterative/example-get-started \
    --branch 8-evaluation \ 
    && git -C /root/example-get-started \
    checkout -b katacoda-project


WORKDIR /root/example-get-started

RUN RELEASE_HASH=${RELEASE_HASH} \
    apt-get update -y \
    && apt-get install -y \
               python3 \
               python3-pip \
               python-is-python3 \
    && pip3 install -r src/requirements.txt


RUN RELEASE_HASH=${RELEASE_HASH} \
    dvc pull \
    && head -n 12000 data/data.xml > data/data.xml.1  \
    && mv data/data.xml.1 data/data.xml \
    && dvc add data/data.xml \
    && git add . \
    && git commit -m "Modified for Katacoda Experiments Scenario" \
    && dvc gc -f --workspace

COPY start.sh /root/start.sh

EXPOSE 80

CMD ["/bin/bash", "-i"]

