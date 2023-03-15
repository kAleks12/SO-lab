#!/bin/bash

# echo dupa   

DIRECTORY=${1:-katalog} # pobierz pierwszy paramtetr
FILE=${2:-src}

if [[ -d ${DIRECTORY} ]]; then
    echo "Katalog istnieje"
    rm -rf ${DIRECTORY}
fi

mkdir ${DIRECTORY}
ITEMS=$(cat ${FILE})

echo "${ITEMS}"

# debugowanie
# set -x    

COUNTER=0
for ITEM in ${ITEMS}; do 

    # test $((COUNTER % 2)) -eq 0
    if [[ $((COUNTER % 2)) -eq 0 ]]; then
        echo "Creating ${ITEM} as file"
        touch ${DIRECTORY}/${ITEM}
    
    else
        echo "Creating ${ITEM} as directory"
        mkdir ${DIRECTORY}/${ITEM}  
    fi

    COUNTER=$((COUNTER + 1))
done

# mv A B - przeniesienie pliku
# cp A B - skopiowanie pliku