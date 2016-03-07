#!/bin/sh

nohup ~/scripts/Linuxwallpaper.jar &

sh wallpapers.sh

while true 
do
    sh /home/pieter/scripts/wallpaperchange.sh
    sleep 500
done
