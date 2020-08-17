#!/bin/bash

path=$1

#echo $path

count_upp=$(ls $path | grep -c bak)

echo $count_upp

if [ $count_upp -ge 7 ];then
  echo "need clear"
  /usr/bin/find $path -type f -atime +7 -exec rm -f \{\} \; >/dev/null 2>&1
else
  echo "not clear"
fi
