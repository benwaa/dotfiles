# MacPorts Installer addition on 2009-09-03_at_07:40:16: adding an appropriate PATH variable for use with MacPorts.
# Finished adapting your PATH environment variable for use with MacPorts.

#PATH=/usr/local/sbin:/usr/local/bin:$PATH:"/usr/bin/X11:/usr/X11R6/bin:/usr/games:/sbin:$HOME/bin"
#export PATH=$PATH:/opt/local/bin:/opt/local/sbin

#export PYTHONPATH="/Users/corda/Documents/Research/PhD/Usiris/python":$PYTHONPATH
#export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig

# Viewer/Editeur par defaut (pour Crontab, CVS,...)
export VISUAL=emacs
export EDITOR=emacs

# permissions : 
# rw-r--r-- (new file)
# rwxr-xr-x (new directory)
umask 022

limit coredumpsize 0

export LS_COLORS='ow=01;45'
