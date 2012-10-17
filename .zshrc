# /etc/zshrc ou ~/.zshrc
# Fichier de configuration principal de zsh
# Formation Debian GNU/Linux par Alexis de Lattre
# http://www.via.ecp.fr/~alexis/formation-linux/

# new function

function mydu () {
du -d 0 -k ${1-$PWD}/* | sort -n | awk '
        BEGIN {
                split("KB,MB,GB,TB", Units, ",");
        }
        {
                u = 1;
                while ($1 >= 1024) {
                        $1 = $1 / 1024;
                        u += 1
                }
                $1 = sprintf("%.1f %s", $1, Units[u]);
                print $0;
        }'
}

# Terminal colours (after installing GNU coreutils)
NM="\[\033[0;38m\]" #means no background and white lines
HI="\[\033[0;37m\]" #change this for letter colors
HII="\[\033[0;31m\]" #change this for letter colors
SI="\[\033[0;33m\]" #this is for the current directory
IN="\[\033[0m\]"

#
# 1. Les alias
#
alias mychrome='/Applications/Chromium.app/Contents/MacOS/Chromium --allow-running-insecure-content&'
alias octave='exec "/Applications/Octave.app/Contents/Resources/bin/octave"'
alias findFlash='lsof | grep FlashTmp'
alias ql='qlmanage -p 2>/dev/null'
alias mofo='ssh -XC mofo@greendotblade3.cs.nyu.edu'
alias aqua='open -a Aquamacs'
alias mytexiervnc='vncviewer -compresslevel 9 -via bird texier.cs:1'
alias mybird='ssh -XC bird.cs.nyu.edu'
alias mygreendotblade3='ssh -XC greendotblade3.cs.nyu.edu'
alias opencv='/opt/local/share/opencv'
alias usi='cd /Users/corda/Documents/Research/PhD/Fall09/Usiris'
alias class='cd /Users/corda/Documents/Research/PhD/Fall11'
alias research='cd /Users/corda/Documents/Research/PhD'
alias xlearn='cd /Users/corda/Documents/Research/PhD/xlearn'
alias emacs='emacs -fn fixed'
alias ipy='ipython'
alias ipy27='/opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin/ipython'
alias mymocap='ssh show@mocap'
alias vncbird='vncviewer -compresslevel 9 bird:1  -passwd ~/.vnc/passwd'
alias vnclagr='vncviewer -compresslevel 9 -via lagr@lagr2.cs.nyu.edu localhost:1'
alias vncgreen2='vncviewer -compresslevel 9 -via corda@greendotblade2.cs.nyu.edu localhost:1'
alias vncgreen1='vncviewer -compresslevel 9 -via benoit@greendotblade1.cs.nyu.edu localhost:1'
alias vncgreen3='vncviewer -compresslevel 9 greendotblade3.cs.nyu.edu:1'

#  Gestion du ls : couleur + touche pas aux accents
alias ls='gls --classify --tabsize=1 --literal --color=auto --show-control-chars --human-readable'

# Demande confirmation avant d'�craser un fichier
alias cp='gcp --interactive'
alias mv='gmv --interactive'
alias rm='grm --interactive'

# Raccourcis pour 'ls'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'

# Quelques alias pratiques
alias df='df -h'
alias c='clear'
alias less='less --quiet'
alias s='cd ..'

#
# 2. Prompt et D�finition des touches
#

# exemple : ma touche HOME, cf man termcap, est codifiee K1 (upper left
# key on keyboard) dans le /etc/termcap. En me referant a l'entree
# correspondant a mon terminal (par exemple 'linux') dans ce fichier, je
# lis : K1=\E[1~, c'est la sequence de caracteres qui sera envoyee au
# shell. La commande bindkey dit simplement au shell : a chaque fois que
# tu rencontres telle sequence de caractere, tu dois faire telle action.
# La liste des actions est disponible dans "man zshzle".

# Un charset fran�ais
export LESSCHARSET="latin1"

# switches the Zsh bindings back to the 'Emacs' mode
bindkey -e

# Correspondance touches-fonction
bindkey '^A'    beginning-of-line       # Home
bindkey '^E'    end-of-line             # End
bindkey '^D'    delete-char             # Del
bindkey '[3~' delete-char             # Del
bindkey '[2~' overwrite-mode          # Insert
bindkey '[5~' history-search-backward # PgUp
bindkey '[6~' history-search-forward  # PgDn
bindkey '^R' history-incremental-search-backward # search back
bindkey '^S' history-incremental-search-forward  # search forward
bindkey '^b'    backward-word  # Move backward one word
bindkey '^n'    forward-word   # Move forward one word

# Prompt couleur (la couleur n'est pas la m�me pour le root et
# pour les simples utilisateurs)
if [ "`id -u`" -eq 0 ]; then
  export PS1="%{[33;36;1m%}%T%{[0m%} %{[33;34;1m%}%n%{[0m[33;33;1m%}@%{[33;37;1m%}%m %{[33;32;1m%}%~%{[0m[33;33;1m%}
%#%{[0m%} "
else
  export PS1="%{[33;36;1m%}%T%{[0m%} %{[33;31;1m%}%n%{[0m[33;33;1m%}@%{[33;37;1m%}%m %{[33;32;1m%}%~%{[0m[33;33;1m%}
%#%{[0m%} "
fi

# Console linux, dans un screen ou un rxvt
if [ "$TERM" = "linux" -o "$TERM" = "screen" -o "$TERM" = "rxvt" ]
then
  # Correspondance touches-fonction sp�cifique
  bindkey '[1~' beginning-of-line       # Home
  bindkey '[4~' end-of-line             # End
fi

# xterm
if [ "$TERM" = "xterm" ]
then
  # Correspondance touches-fonction sp�cifique
  bindkey '[H'  beginning-of-line       # Home
  bindkey '[F'  end-of-line             # End
fi

# Gestion de la couleur pour 'ls' (exportation de LS_COLORS)
if [ "$TERM" != "dumb" ]; then
    [ -e "$HOME/.dircolors" ] && DIR_COLORS="$HOME/.dircolors"
    [ -e "$DIR_COLORS" ] || DIR_COLORS=""
    #eval "`dircolors -b $DIR_COLORS`"
    alias ls='gls --classify --tabsize=0 --literal --color=auto --show-control-chars --human-readable'
fi

#
# 3. Options de zsh (cf 'man zshoptions')
#

# Je ne veux JAMAIS de beeps
unsetopt beep
unsetopt histbeep
unsetopt listbeep
# >| doit �tre utilis�s pour pouvoir �craser un fichier d�j� existant ;
# le fichier ne sera pas �cras� avec '>'
unsetopt clobber
# Ctrl+D est �quivalent � 'logout'
unsetopt ignore_eof
# Affiche le code de sortie si diff�rent de '0'
setopt print_exit_value
# Demande confirmation pour 'rm *'
unsetopt rm_star_silent
# Correction orthographique des commandes
# D�sactiv� car, contrairement � ce que dit le "man", il essaye de
# corriger les commandes avant de les hasher
#setopt correct

# Sch�mas de compl�tion

# - Sch�ma A :
# 1�re tabulation : compl�te jusqu'au bout de la partie commune
# 2�me tabulation : propose une liste de choix
# 3�me tabulation : compl�te avec le 1er item de la liste
# 4�me tabulation : compl�te avec le 2�me item de la liste, etc...
# -> c'est le sch�ma de compl�tion par d�faut de zsh.

# Sch�ma B :
# 1�re tabulation : propose une liste de choix et compl�te avec le 1er item
#                   de la liste
# 2�me tabulation : compl�te avec le 2�me item de la liste, etc...
# Si vous voulez ce sch�ma, d�commentez la ligne suivante :
#setopt menu_complete

# Sch�ma C :
# 1�re tabulation : compl�te jusqu'au bout de la partie commune et
#                   propose une liste de choix
# 2�me tabulation : compl�te avec le 1er item de la liste
# 3�me tabulation : compl�te avec le 2�me item de la liste, etc...
# Je n'ai malheureusement jamais r�ussi � mettre en place ce sch�ma
# alors qu'il me para�t �tre le sch�ma id�al !
# Si vous savez comment faire �a avec zsh -> alexis@via.ecp.fr

# Options de compl�tion
# Quand le dernier caract�re d'une compl�tion est '/' et que l'on
# tape 'espace' apr�s, le '/' est effa��
setopt auto_remove_slash
# Fait la compl�tion sur les fichiers et r�pertoires cach�s
setopt glob_dots

# Traite les liens symboliques comme il faut
#setopt chase_links

# Quand l'utilisateur commence sa commande par '!' pour faire de la
# compl�tion historique, il n'ex�cute pas la commande imm�diatement
# mais il �crit la commande dans le prompt
setopt hist_verify
#ignorer les doublon historique + les commande comman�ant par espace
setopt hist_ignore_all_dups
setopt hist_ignore_space
# Si la commande est invalide mais correspond au nom d'un sous-r�pertoire
# ex�cuter 'cd sous-r�pertoire'
setopt auto_cd
# L'ex�cution de "cd" met le r�pertoire d'o� l'on vient sur la pile
setopt auto_pushd
# Ignore les doublons dans la pile
setopt pushd_ignore_dups
# N'affiche pas la pile apr�s un "pushd" ou "popd"
setopt pushd_silent
# "pushd" sans argument = "pushd $HOME"
setopt pushd_to_home

# Les jobs qui tournent en t�che de fond sont nic� � '0'
unsetopt bg_nice
# N'envoie pas de "HUP" aux jobs qui tourent quand le shell se ferme
unsetopt hup

# BUG Corriged (NiCH2O) [ligne bouffee]
unsetopt PROMPT_CR


#
# 4. Param�tres de l'historique des commandes
#

# Nombre d'entr�es dans l'historique
export HISTORY=100000000
export SAVEHIST=100000000
export HISTSIZE=10000000000000
# Fichier o� est stock� l'historique
export HISTFILE=$HOME/.history
# ignore some stuff 
export HISTIGNORE="&:ls:[bf]g:exit:reset:clear:cd:cd ..:cd.."
export HISTIGNORE="cd:ls:ll:la:rm:[bf]g:clear"
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_VERIFY
#
# 5. Compl�tion des options des commandes
#

zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}'
zstyle ':completion:*' max-errors 3 numeric
zstyle ':completion:*' use-compctl false

autoload -U compinit
compinit -i

# Prompts for confirmation after 'rm *' etc
# Helps avoid mistakes like 'rm * o' when 'rm *.o' was intended
setopt RM_STAR_WAIT

pman () {
    man -t "${1}" | open -f -a /Applications/Preview.app
}
