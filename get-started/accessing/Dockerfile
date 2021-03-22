FROM emresult/dvc-base:latest

WORKDIR /root/project

COPY init-for-build.sh /root/init-for-build.sh
COPY start.sh /root/start.sh
COPY process.py /root/project/process.py

RUN /root/init-for-build.sh

CMD ["/bin/bash", "-i"]

