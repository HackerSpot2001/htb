#!/bin/bash
#Using hyd3sec's list here: https://hyd3sec.github.io/oscp%20prep/2020/06/22/OSCP-HTB-List.html

boxes=("Servmon:0" "Resolute:0" "Magic:0" "Admirer:0" "Nest:0" "Sauna:0" "Cache:0" "Optimum:0" "Jeeves:0" "Valentine:0" "Bashed:0" "Shocker:0" "Jerry:0" "Friendzone:0" "Nibbles:0" "Nineveh:0" "Beep:0" "Solidstate:0" "Sense:0" "Grandpa:0" "Devel:0" "Lame:0" "Bastard:0" "Poison:0" "Cronos:0" "Sunday:0" "Irked:0" "Tartarsauce:0" "Swagshop:0" "Granny:0" "Blunder:0" "Arctic:0" "Node:0" "Legacy:0" "DevOops:0" "Hawk:0" "Networked:0" "Chatterbox:0" "SecNotes:0")

usage="./todo [options] [box]

OPTIONS:
-c [box name]       mark a box as complete
-u [box name]       undo a box completion

I don't sanitize input so if you don't know how to type a 
box name just call script with no args.
"

while getopts c:u: flag
do
  case "${flag}" in
    c) completebox=${OPTARG};;
    u) undobox=${OPTARG};;
  esac
done

echo "Box Status:"
for i in "${boxes[@]}"
do
  val=`echo $i | cut -d\: -f2`
  key=`echo $i | cut -d\: -f1`
  if [ "$completebox" = "$key" ]
  then
    boxes[$i]="$completebox:1"
  elif [ "$undobox" = "$key" ]; then
    boxes[$i]="$undobox:0"
  fi

  if [ $val -eq 1 ]
  then
    echo "[+] $key"
  else
    echo "[-] $key"
  fi
done

echo "Your next box to do is:"
