#!/bin/bash
cwd=`pwd`

cd ~/scripts/wall

teller=0
a=$1

# Get the images in order and use the teller to get the right one. 
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
