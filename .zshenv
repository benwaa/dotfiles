# MacPorts Installer addition on 2009-09-03_at_07:40:16: adding an appropriate PATH variable for use with MacPorts.
# Finished adapting your PATH environment variable for use with MacPorts.

# Path
PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/texbin
PATH=~/lua-local/bin:/usr/local/bin:$PATH:/usr/local/cuda/bin
export PATH
#export PATH=$PATH:/opt/local/bin:/opt/local/sbin

# LD_LIBRARY_PATH
#export LD_LIBRARY_PATH=/Users/corda/lua-local/lib:/usr/local/cuda/lib:/opt/local/lib:/usr/local/lib:/usr/lib:$LD_LIBRARY_PATH
# DYLD_LIBRARY_PATH
#export DYLD_LIBRARY_PATH=/usr/local/cuda/lib
# MacPorts Installer addition on 2009-09-03_at_07:40:16: adding an appropriate MANPATH variable for use with MacPorts.
#export MANPATH=/opt/local/share/man:$MANPATH
# Finished adapting your MANPATH environment variable for use with MacPorts.

#export PYTHONPATH="/Users/corda/Documents/Research/PhD/Usiris/python":$PYTHONPATH

export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig

# Viewer/Editeur par defaut (pour Crontab, CVS,...)
export VISUAL=emacs
export EDITOR=emacs

# permissions : 
# rw-r--r-- (new file)
# rwxr-xr-x (new directory)
umask 022

limit coredumpsize 0

export LS_COLORS='ow=01;45'
