#!/bin/sh

find . -name "Network\ Trash\ Folder" -exec rm -rvf {} \;
find . -name "Temporary\ Items" -exec rm -rvf {} \;
find . -name ":2eapdisk" -exec rm -vf {} \;
find . -name ".AppleD*" -exec rm -rvf {} \;
find . -name ".DS_Store" -exec rm -vf {} \;
find . -name "*~" -exec rm -vf {} \;
find . -name "*~" -exec rm -vf {} \;
find . -name "#*#" -exec rm -vf {} \;
find . -name ".#*" -exec rm -vf {} \;
find . -name "*.pyo" -exec rm -vf {} \;
find . -name "*.pyx" -exec rm -vf {} \;
find . -name "Thumbs.db" -exec rm -vf {} \;
