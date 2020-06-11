set -eu
cd $(dirname $0)
 
TARGET_FILE=${1:-"./log.txt"}
ERROR_MSGS=${2:-"./err_msgs.txt"}
 
check_log () {
while read LINE
do
  for TARGET_WORD in $(cat ${ERROR_MSGS})
  do
    local target_msg=$(echo ${LINE} | grep ${TARGET_WORD})
    if [ -n "${target_msg}" ]; then
          echo "err!!!"
    fi
  done
done
}
 
tail -n 0 -F ${TARGET_FILE} | check_log 
