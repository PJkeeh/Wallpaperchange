#!/bin/bash
echo "Installing. There is still no error reporting."

cp=`pwd`

path=~/scripts/

mkdir $path

cp removeCurrent.sh $path
cp removeWallpaper.sh $path
cp wallpaperchange.sh $path
cp wallpapers.sh $path
cp loopWallpaper.sh $path
cp LICENSE $path

cd /home/pieter/git/Wallpaperchange/linuxwallpaper/src

javac linuxwallpaper/Linuxwallpaper.java
jar cfm Linuxwallpaper.jar MANIFEST.MF linuxwallpaper/Linuxwallpaper.class linuxwallpaper/*
rm linuxwallpaper/*.class

chmod +x Linuxwallpaper.jar
mv Linuxwallpaper.jar $path

cd $cp

echo "All done"
