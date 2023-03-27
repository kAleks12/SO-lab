#!/bin/bash -eu

DIR_1=${1:-placeholder} # pobierz pierwszy paramtetr
DIR_2=${2:-placeholder}

if [[ ${DIR_1} == "placeholder" ]] || [[ ${DIR_2} ==     "placeholder" ]]; then
    echo "Please input both directories"
    exit 2
fi

if ! [[ -d ${DIR_1} ]]; then
    echo "First directory does not exist"
    exit 1 
fi
if ! [[ -d ${DIR_2} ]]; then
    echo "Second directory does not exist"
    exit 1 
fi

for ITEM in ${DIR_1}/*; do 
    FILE_NAME=${ITEM##*/}
    LINK_NAME=${FILE_NAME^^}

    if [[ -L ${ITEM} ]];  then
        echo "${ITEM} - is a symbolic link"
        LINK_NAME="${LINK_NAME}_ln"
    elif [[ -f ${ITEM} ]]; then
        echo "${ITEM} - is a file"
        LINK_NAME=${LINK_NAME/./_ln.}
    elif [[ -d ${ITEM} ]]; then
        echo "${ITEM} - is a directory"
        LINK_NAME="${LINK_NAME}_ln"
    fi

    ln -s ${ITEM} "${DIR_2}/${LINK_NAME}"
done