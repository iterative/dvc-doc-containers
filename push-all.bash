#!/usr/bin/env bash

set -vex

HERE="$( cd "$(dirname "$0")" ; pwd -P )"
export RELEASE_HASH="${RELEASE_HASH:-$(curl -s https://api.github.com/repos/iterative/dvc/releases/latest | sha256sum | cut -c -8)}"
export TAG_PREFIX="${TAG_PREFIX:-dvcorg}"

DIR=$(dirname $0)
cd "${DIR}"

find $DIR -name Dockerfile | sort | while read -r filepath ; do
    dockerdir=$(dirname ${filepath})
    tagfile=${dockerdir}/Dockertag
    if [ -f ${tagfile} ] ; then
        TAG=$(head -n 1 ${tagfile})
    else
        TAG=$(echo "${dockerdir}[3,100]}" | tr '/ ' '--')
    fi
    if [[ "${TAG}" ~= '.*/.*' ]] ; then
        echo "PUSHING: ${dockerdir} with the tag: ${TAG}"
        docker push ${TAG}
    else 
        echo "PUSHING: ${dockerdir} with the tag: ${TAG_PREFIX}/${TAG}"
        docker push ${TAG_PREFIX}/${TAG}
    fi
done
