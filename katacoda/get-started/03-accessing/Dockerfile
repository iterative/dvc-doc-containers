FROM dvcorg/katacoda-base:latest

RUN apt-get update -y && apt-get install -y \
                         python3 \
                         python-is-python3 \
                         python3-pip

RUN pip3 install dvc

RUN git init /root/example-get-started

WORKDIR /root/example-get-started

COPY process.py /root/process.py
COPY start.sh /root/start.sh

CMD ["/bin/bash", "-i"]

