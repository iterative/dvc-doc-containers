#!/usr/bin/env bash

set -uvex

HERE="$( cd "$(dirname "$0")" ; pwd -P )"
export TAG_PREFIX="${TAG_PREFIX:-dvcorg}"

find . -name generate.* | sort | while read -r filepath ; do 
    filename=$(basename -- "$filepath")
    dirname=$(dirname -- "$filepath")
    ext="${filename##*.}"
    pushd $dirname
    if [[ "$ext" == "bash" ]] ; then
        bash "$filename"
    elif [[ "$ext" == "sh" ]] ; then
        sh "$filename" 
    elif [[ "$ext" == "zsh" ]] ; then
        zsh "$filename"
    elif [[ "$ext" == "py" ]] ; then
        python "$filename" 
    else
        echo "UNSUPPORTED GENERATOR SCRIPT: $filepath"
    fi
    popd
done

