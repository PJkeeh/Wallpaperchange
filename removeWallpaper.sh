#!/bin/bash
cwd=`pwd`

cd /home/pieter/scripts/wall

teller=0
a=$1

for i in `ls *.jpg | sort -V`; do
  teller=`expr "$teller" + 1`
  if [ "$teller" -eq "$1" ]; then
	echo $teller $1 removed
	rm "$i"
  fi
	
  if [ "$teller" -gt "$1" ]; then
	  new=$a
	  echo "$new".jpg $i
	  mv "${i}" "${new}".jpg
	  a=`expr "$a" + 1`
  fi
done

cd $cwd
