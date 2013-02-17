# Viewer/Editeur par defaut (pour Crontab, CVS,...)
export VISUAL=emacs
export EDITOR=emacs

# permissions : 
# rw-r--r-- (new file)
# rwxr-xr-x (new directory)
umask 022

limit coredumpsize 0

export LS_COLORS='ow=01;45'
