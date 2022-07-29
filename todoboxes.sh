#!/bin/bash
#Using hyd3sec's list here: 
#https://hyd3sec.github.io/oscp%20prep/2020/06/22/OSCP-HTB-List.html

boxes="todolist.txt"

while getopts 'c:u:' OPTION; do
  case "$OPTION" in
    c)
      complete="$OPTARG"
      ;;
    u)
      undone="$OPTARG"
      ;;
    ?)
      echo "usage: $(basename $0) [-c boxname] [-u boxname]"
      exit 1
      ;;
  esac
done
shift "$(($OPTIND -1))"

echo "$complete"
if [ $complete ]; then
  sed -i "/$complete/s/0/1/g" $boxes
elif [ $undone ]; then
  sed -i "/$undone/s/1/0/g" $boxes
fi


echo "Box Status:"
#Iter through my dict lol
while read line; 
do
  val=`echo $line | cut -d\: -f2`
  key=`echo $line | cut -d\: -f1`

  if [ $val -eq 1 ]
  then
    echo "[+] $key"
  else
    echo "[-] $key"
  fi
done < $boxes

echo "Your next box to do is:"
#This will be where we check for the first 0 value and
#then display it. Unnecessary functionality aside from
#fuck you and I want to do it.
