#!/usr/bin/env bash

set -uvex

HERE="$( cd "$(dirname "$0")" ; pwd -P )"

export TAG_PREFIX="${TAG_PREFIX:-dvcorg}"

find "${HERE}" -name Dockerfile | sort | while read -r filepath ; do
    dockerdir=$(dirname "${filepath}")
    tagfile="${dockerdir}/Dockertag"
    if [ -f "${tagfile}" ] ; then
        TAG=$(head -n 1 "${tagfile}")
    else
        TAG=$(echo "${dockerdir:3:100}" | tr '/ ' '--')
    fi

    if [[ "${TAG}" =~ "${TAG_PREFIX}/" ]] ; then
        echo "BUILDING: ${dockerdir} with the tag: ${TAG}"
        docker build -t "${TAG}" "${dockerdir}/"
    else
        echo "BUILDING: ${dockerdir} with the tag: ${TAG_PREFIX}/${TAG}"
        docker build -t "${TAG_PREFIX}/${TAG}" "${dockerdir}/"
    fi
done
