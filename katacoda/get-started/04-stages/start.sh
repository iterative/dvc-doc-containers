#!/bin/bash

# Start web server to serve files from the container

nohup python3 -m http.server -d /root/ 80 &> /dev/null &

# clear screen
clear

echo "##########################"
echo "#   DVC Stages Example   #"
echo "##########################"

tree .
dvc version
