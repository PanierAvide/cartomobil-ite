#!/bin/bash

set -e 

WORKDIR=$(dirname $(realpath ${0}))
CONNEXION="${1}"
IMPORT_FILE=`pwd`/import.yml

cd ${WORKDIR}

osmosis --rri /home/prod/data/diffs --simplify-change --write-xml-change /home/prod/data/diffs/changes.osc.gz

imposm diff -mapping ${IMPORT_FILE} -cachedir /home/prod/data/imposm_cache -dbschema-production public -connection ${CONNEXION} /home/prod/data/diffs/changes.osc.gz
