#!/bin/bash

set -e

DATASET_URL="http://download.openstreetmap.fr/extracts/south-america/polynesie-latest.osm.pbf"
REPLICATION_URL="http://download.openstreetmap.fr/replication/south-america/polynesie/minute/"
CONNEXION=${1}
DATASET=`basename ${DATASET_URL}`
IMPORT_FILE=`pwd`/import.yml
echo "Using config file ${IMPORT_FILE}"

mkdir -p /home/prod/data
cd /home/prod/data
wget -NS ${DATASET_URL}
mkdir -p /home/prod/data/diffs

imposm import -mapping "${IMPORT_FILE}" -read "/home/prod/data/${DATASET}" -overwritecache -cachedir /home/prod/data/imposm_cache -diff -diffdir /home/prod/data/diffs
imposm import -write -connection "${CONNEXION}" -mapping "${IMPORT_FILE}" -cachedir /home/prod/data/imposm_cache -dbschema-import public -diff

cat /home/prod/data/diffs/last.state.txt|grep -v replicationUrl > /home/prod/data/diffs/state.txt
echo "baseUrl=${REPLICATION_URL}" > /home/prod/data/diffs/configuration.txt
echo maxInterval = 7200 >> /home/prod/data/diffs/configuration.txt
