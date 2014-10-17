#!/bin/bash
echo "Getting wallpapers"

mkdir /home/pieter/scripts/wall
cd /home/pieter/scripts/wall
mkdir temp
cd temp

curl -s http://www.reddit.com/r/wallpapers/.json | tr ',' '\n' | grep url.*\.jpg -o | cut -c8- | xargs wget

a=1
for i in *.jpg; do
  test=$(identify /home/pieter/scripts/wall/temp/$i | grep '[0-9][0-9][0-9][0-9]x[0-9][0-9][0-9][0-9]' -o)
  if [ -n "$test" ]; then
  	new=$a #04 pad to length of 4
  	mv ${i} ${new}.jpg
  	a=`expr "$a" + 1`
  	echo $a
  else
	rm /home/pieter/scripts/wall/temp/$i
  fi
done

if [ -f /home/pieter/scripts/wall/temp/1.jpg ]; then
	rm ../*.jpg
	mv *.jpg ../
	cd ..
	
fi
	rm -r /home/pieter/scripts/wall/temp
cd ~
