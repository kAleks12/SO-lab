SOURCE_DIR=${1:-lab_uno} # pobierz pierwszy paramtetr
RM_LIST=${2:-2remove}
TARGET_DIR=${3:-bakap}

echo "Starting with parameters:"
echo "[*] SOURCE_DIR: ${SOURCE_DIR}"
echo "[*] TARGET_DIR: ${TARGET_DIR}"
echo -e "[*] RM_LIST: ${RM_LIST}\n"

# creating target directory
if ! [[ -d ${TARGET_DIR} ]]; then
    mkdir ${TARGET_DIR}
fi

# deleting files from RM_LIST
for ITEM in ${RM_LIST}; do 
    if [[ -f ${SOURCE_DIR}/${ITEM} ]]; then
        rm ${SOURCE_DIR}/${ITEM}
    fi
done

# removing files and copying folders from SOURCE_DIR
for ITEM in ${SOURCE_DIR}/*; do 
    if [[ -d ${ITEM} ]]; then
        cp -r ${ITEM} ${TARGET_DIR}
    elif [[ -f ${ITEM} ]]; then
        mv ${ITEM} ${TARGET_DIR}
    fi
done

COUNTER=0
for ITEM in ${SOURCE_DIR}/*; do 
    COUNTER=$((COUNTER + 1))
done

if [[ ${COUNTER} -gt 0 ]]; then
    echo "Jeszcze cos zostalo!"

    if [[ ${COUNTER} -ge 2 ]]; then
        echo "Zostały conajmniej dwa pliki :)"
    fi

    if [[ ${COUNTER} -gt 4 ]]; then
        echo "Zostało wiecej niz 4 pliki :)"
    fi

    if [[ ${COUNTER} -ge 2 ]] &&  [[ ${COUNTER} -le 4 ]]; then
        echo "Zostały conajmniej dwa pliki, ale nie wiecej niz 4 :)"
    fi
fi

# getting last modification date of the script and packing TARGET_DIR to ZIP
LAUNCH_DATE=$(date -r lab1.sh "+%m-%d-%Y")
zip -r bakap_${LAUNCH_DATE}.zip ${TARGET_DIR} > /dev/null
rm -rf ${TARGET_DIR}
echo -e "\nBackup zrobiony i spakowany :)))"