#!/bin/bash

# prompt
PS1='\[\033[01;34m\]\w\[\033[00m\]$ \[\033[01;32m\]'
trap 'echo -ne "\033[00m"' DEBUG

# clear screen
clear

:;: "########################################"
:;: "# DVC Data and Model Accessing Example #"
:;: "########################################"

tree .
dvc version
