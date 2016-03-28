# Wallpaperchange
Gets wallpapers of reddit and shows a new one every 5 minutes as desktop background. Designed for Ubuntu Unity.

# Requirements
ImageMagick (sudo apt-get install ImageMagick)
openjdk (sudo apt-get install openjdk-8-jdk)


How to install:
0) Check if requirements are met

1) Run install.sh

2) Add sh ~/.wallpaperchange/loopWallpaper.sh to your startup applications


# Known issues

./install.sh: line 19: javac: command not found
./install.sh: line 20: jar: command not found

1) check if openjdk is installed:
    sudo apt-get install openjdk-8-jdk
    
2) check if the link to javac is correct
    sudo update-alternatives --config javac
    
3) Alternativelt you can reselect the right java version using
    sudo update-alternatives --config java
    
./wallpapers.sh: line 13: identify: command not found

1) check if ImageMagick is installed:
    sudo apt-get install ImageMagick
