#!/bin/bash

set -uvex

HERE="$( cd "$(dirname "$0")" ; pwd -P )"

if [[ -d "${HERE}/build" ]] ; then
    echo "Please delete ${PWD}/build directory first."
    exit
fi

export RELEASE_HASH="${RELEASE_HASH:-$(curl -s https://api.github.com/repos/iterative/dvc/releases/latest | sha256sum | cut -c -8)}"
export TAG_PREFIX="${TAG_PREFIX:-dvcorg}"

find ${HERE} -name Dockerfile.template | sort | while read -r filepath  ; do
    ABSOLUTE_SOURCE=$(dirname "$filepath")
    SOURCE_DIR=$(realpath --relative-to="${HERE}" "${ABSOLUTE_SOURCE}")
    TARGET_DIR="${HERE}/build/${SOURCE_DIR}"
    if [ ! -d "${TARGET_DIR}" ] ; then
        mkdir -p "${TARGET_DIR}"
    fi
    cp -fr ${ABSOLUTE_SOURCE}/* "${TARGET_DIR}"
    cat "${ABSOLUTE_SOURCE}/Dockerfile.template" | envsubst > "${TARGET_DIR}/Dockerfile"
    cat "${ABSOLUTE_SOURCE}/Dockertag.template" | envsubst > "${TARGET_DIR}/Dockertag"
    rm -f "${TARGET_DIR}/Dockerfile.template"
    rm -f "${TARGET_DIR}/Dockertag.template"
done

unset RELEASE_HASH
