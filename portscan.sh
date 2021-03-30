#!/bin/bash
#fire@fire7.ru
#port scanner bash
t1=0.1 # 2 msec
while getopts ":h:p:" opt; do
      case $opt in
        h ) HOSTS="$OPTARG";;
    p ) PORTS="$OPTARG";;
        \? ) echo "Invalid option: -"$OPTARG"" >&2
            exit 1;;
        : ) echo "Option -"$OPTARG" requires an argument." >&2
            exit 1;;
      esac
    done
arrports=(${PORTS//-/ })
if [[ $# -ne 4 ]];then
echo "Invalid option: $@"
echo "Example: ./scan.sh -h rmd5.ru -p 79-81"
exit 1
fi
for ((i = ${arrports[0]}; i <= ${arrports[1]}; i++ )); do
aaa=$(timeout $t1 bash -c "</dev/tcp/$HOSTS/$i" && echo "HOST:[$HOSTS] Port tcp $i open.")
if [[ -n $aaa ]];then
echo "$aaa"
fi
done⏎