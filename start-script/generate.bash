#!/bin/bash


HERE="$( cd "$(dirname "$0")" ; pwd -P )"

if [[ -d build ]] ; then
    echo "Please delete ${PWD}/build directory first."
    exit
fi

# Clone dvc-get-started
git clone https://github.com/iterative/dvc-get-started

GIT_TAGS=$(git -C dvc-get-started tag --list)

for TAG in ${GIT_TAGS} ; do
    TAG_DIR="build/${TAG}"
    mkdir -p ${TAG_DIR}

    export GIT_TAG=${TAG}

    git clone dvc-get-started -b ${GIT_TAG} ${TAG_DIR}/dvc-get-started

    cp bashrc ${TAG_DIR}/.bashrc
    cat Dockerfile.template | envsubst > ${TAG_DIR}/Dockerfile
    cat Dockertag.template | envsubst > ${TAG_DIR}/Dockertag
done

unset GIT_TAG
unset RELEASE_HASH
