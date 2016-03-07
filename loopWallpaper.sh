#!/bin/sh

nohup ~/scripts/Linuxwallpaper.jar &

while true 
do
    sh /home/pieter/scripts/wallpaperchange.sh
    sleep 500
done
