#!/usr/bin/env bash

set -vex

HERE="$( cd "$(dirname "$0")" ; pwd -P )"
export RELEASE_HASH="${RELEASE_HASH:-$(curl -s https://api.github.com/repos/iterative/dvc/releases/latest | sha256sum | cut -c -8)}"
export TAG_PREFIX="${TAG_PREFIX:-dvcorg}"

DIR=$(dirname $0)
cd "${DIR}"

find ${DIR} -name generate.* | sort | while read -r filepath ; do 
    filename=$(basename -- "$filepath")
    dirname=$(dirname -- "$filepath")
    ext="${filename##*.}"
    cd $dirname
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
    cd -
done

