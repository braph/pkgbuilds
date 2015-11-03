#!/bin/bash

if [ -z "$1" ]; then
	file="/etc/freedns-urls"
else
	file=$1
fi

while read line; do

   echo "readed: $line"
   #do not execute comments
   if [[ "$line" != \#* ]];then
      echo "curling: $line"
      #do execute that
      curl --max-time 10 --retry 5 --retry-delay 10 $line &
   fi
   
done <"$file"

wait
