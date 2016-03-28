#!/bin/bash
echo "Changing Wallpaper"

#FOR CRON
PID=$(pgrep gnome-session)
export DBUS_SESSION_BUS_ADDRESS=$(grep -z DBUS_SESSION_BUS_ADDRESS /proc/$PID/environ|cut -d= -f2-)

#MY SCRIPT
a=$(basename $(gsettings get org.gnome.desktop.background picture-uri|cut -c9-))
echo $a >>temp.txt
a=$(rev temp.txt | cut -c2- |rev)
rm temp.txt
b=$(echo $a | cut -c1-2)
c=$(echo $a | cut -c2-2)
if [ "$c" = "." ]; then
	b=$(echo $a | cut -c1-1)
fi
b=`expr "$b" + 1`
if [ -f $HOME/.wallpaperchange/wall/$b.jpg ]; then
	echo	""
else
	b=1
fi
gsettings set org.gnome.desktop.background picture-uri file://$HOME/.wallpaperchange/wall/$b.jpg
echo 'Wallpaper set to '$b


