set -eu
cd $(dirname $0)
 
TARGET_FILE=${1:-"./log.txt"}

check_log () {
while read LINE
do
  local target_msg=$(echo ${LINE} | grep error)
  if [ -n "${target_msg}" ]; then
	echo "err!!!"
  fi
done
}
 
tail -n 0 -F ${TARGET_FILE} | check_log
