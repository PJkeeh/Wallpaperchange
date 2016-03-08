#!/bin/bash
cd ~/.wallpaperchange

nohup ./Linuxwallpaper.jar &

sh wallpapers.sh

while true 
do
    sh wallpaperchange.sh
    sleep 5m
done
