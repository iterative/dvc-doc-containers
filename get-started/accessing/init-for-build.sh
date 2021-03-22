#!/bin/bash

# prompt
PS1='\[\033[01;34m\]\w\[\033[00m\]$ \[\033[01;32m\]'
trap 'echo -ne "\033[00m"' DEBUG

clear
:;: ===================================
:;: Let\'s create a new DVC project 
:;: ===================================
cd /root/project
git init 
dvc init
git add .
git commit -m "Initial DVC files"

