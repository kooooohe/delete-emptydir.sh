#!/bin/bash
set -eu
cd $(dirname $0)
 
DIR=${1:-"./"}
 
while read TARGET_DIR
do
  rm -r ${TARGET_DIR}
done < <(find ${DIR} -type d -empty)
