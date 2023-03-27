#!/bin/bash -eu

TARGET=${1:-placeholder} # pobierz pierwszy paramtetr

if [[ ${TARGET} == "placeholder" ]]; then
    echo "Please input target directory"
    exit 2
fi

if ! [[ -d ${TARGET} ]]; then
    echo "Target directory does not exist"
    exit 1 
fi

for ITEM in ${TARGET}/*; do 
    if [[ -f ${ITEM} ]]; then
        TYPE=${ITEM##*/}
        TYPE=${TYPE#*.}
        echo "${TYPE}"
        if [[ ${TYPE} == "bak" ]]; then
            chmod ou-w ${ITEM}
        elif [[ ${TYPE} == "txt" ]];then
            chmod -rwx ${ITEM}
            chmod u+r ${ITEM}
            chmod g+w ${ITEM}
            chmod o+x ${ITEM}
        fi
    elif [[ -d ${ITEM} ]]; then
        TYPE=${ITEM##*/}
        TYPE=${TYPE#*.}
        if [[ ${TYPE} == "bak" ]]; then
            chmod -x ${ITEM}
            chmod o+x ${ITEM}
        elif [[ ${TYPE} == "tmp" ]];then
            chmod -rw ${ITEM}
            chmod u+rw ${ITEM}
        fi
    fi
done