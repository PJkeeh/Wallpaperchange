#!/bin/bash
echo "Getting wallpapers"

mkdir ./wall
cd ./wall
mkdir temp
cd temp

curl -s http://www.reddit.com/r/wallpapers/.json | tr ',' '\n' | grep url.*\.jpg -o | cut -c8- | xargs wget

a=1
for i in *.jpg; do
  test=$(identify $i | grep '[0-9][0-9][0-9][0-9]x[0-9][0-9][0-9][0-9]' -o)
  if [ -n "$test" ]; then
  	new=$a #04 pad to length of 4
  	mv ${i} ${new}.jpg
  	a=`expr "$a" + 1`
  	echo $a
  else
	$i
  fi
done

cd ../..

if [ -f ./wall/temp/1.jpg ]; then
	rm ./wall/*.jpg
	mv ./wall/temp/*.jpg ./wall/
fi
rm -r ./wall/temp
