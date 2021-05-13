#!/usr/bin/env bash

set -vex

HERE="$( cd "$(dirname "$0")" ; pwd -P )"
export RELEASE_HASH="${RELEASE_HASH:-$(curl -s https://api.github.com/repos/iterative/dvc/releases/latest | sha256sum | cut -c -8)}"
export TAGPREFIX="${TAGPREFIX:-dvcorg}"

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
    echo "PUSHING: ${dockerdir} with the tag: ${TAGPREFIX}/${TAG}"
    docker push ${TAGPREFIX}/${TAG}
done
