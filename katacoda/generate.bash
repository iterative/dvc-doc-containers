#!/bin/bash


HERE="$( cd "$(dirname "$0")" ; pwd -P )"

if [[ -d build ]] ; then
    echo "Please delete ${PWD}/build directory first."
    exit
fi

export RELEASE_HASH="${RELEASE_HASH:-$(curl -s https://api.github.com/repos/iterative/dvc/releases/latest | sha256sum | cut -c -8)}"
export TAG_PREFIX="${TAG_PREFIX:-dvcorg}"

find ${HERE} -name Dockerfile.template | sort | while read -r filepath  ; do
    SOURCE_DIR=${$(dirname -- "$filepath")#"${HERE}"}
    TARGET_DIR=build/${SOURCE_DIR}
    if [ ! -d ${TARGET_DIR} ] ; then
        mkdir -p ${TARGET_DIR}
    fi
    cp -fr ${SOURCE_DIR}/* ${TARGET_DIR}
    cat ${SOURCE_DIR}/Dockerfile.template | envsubst > ${TARGET_DIR}/Dockerfile
    cat ${SOURCE_DIR}/Dockertag.template | envsubst > ${TARGET_DIR}/Dockertag
done

unset RELEASE_HASH
