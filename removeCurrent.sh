#!/bin/bash
a=$(basename $(gsettings get org.gnome.desktop.background picture-uri|cut -c9-))

b=$(echo $a | cut -c1-2)
c=$(echo $a | cut -c2-2)
if [ "$c" = "." ]; then
	b=$(echo $a | cut -c1-1)
fi

sh removeWallpaper.sh $b
