#!/bin/sh

find . -name ".AppleDouble" -exec rm -rvf {} \;
find . -name ".DS_Store" -exec rm -vf {} \;
find . -name "*~" -exec rm -vf {} \;
find . -name "*~" -exec rm -vf {} \;
find . -name "#*#" -exec rm -vf {} \;
find . -name ".#*" -exec rm -vf {} \;
find . -name "*.pyo" -exec rm -vf {} \;
find . -name "*.pyx" -exec rm -vf {} \;
find . -name "Thumbs.db" -exec rm -vf {} \;
