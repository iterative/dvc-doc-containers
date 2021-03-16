FROM python:3.7

WORKDIR /root

RUN wget \
       https://dvc.org/deb/dvc.list \
       -O /etc/apt/sources.list.d/dvc.list

RUN wget -qO - https://dvc.org/deb/iterative.asc | apt-key add -

RUN apt update -y && apt install -y dvc

RUN git clone https://github.com/iterative/example-get-started project

RUN pip3 install wheel 

RUN pip3 install -r project/src/requirements.txt

CMD ['/bin/bash', '-c']





