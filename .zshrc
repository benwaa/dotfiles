# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="ben"
# Comment this out to disable weekly auto-update checks
export DISABLE_AUTO_UPDATE="true"
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
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
alias rsynccopy="rsync --partial --progress --append --rsh=ssh -r -h "
alias rsyncmove="rsync --partial --progress --append --rsh=ssh -r -h --remove-source-files"
alias mychrome='/Applications/Chromium.app/Contents/MacOS/Chromium --allow-running-insecure-content&'
alias octave='exec "/Applications/Octave.app/Contents/Resources/bin/octave"'
alias findFlash='lsof | grep FlashTmp'
alias ql='qlmanage -p 2>/dev/null'
alias aqua='open -a Aquamacs'
alias mytexiervnc='vncviewer -compresslevel 9 -via bird texier.cs:1'
alias mybird='ssh -XC bird.cs.nyu.edu'
alias research='cd /Users/corda/Documents/Research/PhD'
alias xlearn='cd /Users/corda/Documents/Research/PhD/xlearn'
alias emacs='emacs -fn fixed'
alias ipy='ipython'
alias mymocap='ssh show@mocap'
alias gitx='open -a GitX .'
alias vnclagr='vncviewer -compresslevel 9 -via lagr@lagr2.cs.nyu.edu localhost:1'
alias vncgreen2='vncviewer -compresslevel 9 -via corda@greendotblade2.cs.nyu.edu localhost:1'
alias vncgreen1='vncviewer -compresslevel 9 -via benoit@greendotblade1.cs.nyu.edu localhost:1'
alias vncgreen3='vncviewer -compresslevel 9 greendotblade3.cs.nyu.edu:1'

#  Gestion du ls : couleur + touche pas aux accents
alias ls='gls --classify --tabsize=1 --literal --color=auto --show-control-chars --human-readable'

# Demande confirmation avant d'écraser un fichier
#alias cp='gcp --interactive'
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

# Un charset français
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


# Console linux, dans un screen ou un rxvt
if [ "$TERM" = "linux" -o "$TERM" = "screen" -o "$TERM" = "rxvt" ]
then
  # Correspondance touches-fonction spécifique
  bindkey '[1~' beginning-of-line       # Home
  bindkey '[4~' end-of-line             # End
fi

# xterm
if [ "$TERM" = "xterm" ]
then
  # Correspondance touches-fonction spécifique
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
# >| doit être utilisés pour pouvoir écraser un fichier déjà existant ;
# le fichier ne sera pas écrasé avec '>'
unsetopt clobber
# Ctrl+D est équivalent à 'logout'
unsetopt ignore_eof
# Affiche le code de sortie si différent de '0'
setopt print_exit_value
# Demande confirmation pour 'rm *'
unsetopt rm_star_silent
# Correction orthographique des commandes
# Désactivé car, contrairement à ce que dit le "man", il essaye de
# corriger les commandes avant de les hasher
#setopt correct

# Schémas de complétion

# - Schéma A :
# 1ère tabulation : complète jusqu'au bout de la partie commune
# 2ème tabulation : propose une liste de choix
# 3ème tabulation : complète avec le 1er item de la liste
# 4ème tabulation : complète avec le 2ème item de la liste, etc...
# -> c'est le schéma de complétion par défaut de zsh.

# Schéma B :
# 1ère tabulation : propose une liste de choix et complète avec le 1er item
#                   de la liste
# 2ème tabulation : complète avec le 2ème item de la liste, etc...
# Si vous voulez ce schéma, décommentez la ligne suivante :
#setopt menu_complete

# Schéma C :
# 1ère tabulation : complète jusqu'au bout de la partie commune et
#                   propose une liste de choix
# 2ème tabulation : complète avec le 1er item de la liste
# 3ème tabulation : complète avec le 2ème item de la liste, etc...
# Je n'ai malheureusement jamais réussi à mettre en place ce schéma
# alors qu'il me paraît être le schéma idéal !
# Si vous savez comment faire ça avec zsh -> alexis@via.ecp.fr

# Options de complétion
# Quand le dernier caractère d'une complétion est '/' et que l'on
# tape 'espace' après, le '/' est effaçé
# setopt auto_remove_slash
# Fait la complétion sur les fichiers et répertoires cachés
# setopt glob_dots

# Traite les liens symboliques comme il faut
#setopt chase_links

# Quand l'utilisateur commence sa commande par '!' pour faire de la
# complétion historique, il n'exécute pas la commande immédiatement
# mais il écrit la commande dans le prompt
setopt hist_verify
#ignorer les doublon historique + les commande commançant par espace
setopt hist_ignore_all_dups
setopt hist_ignore_space
# Si la commande est invalide mais correspond au nom d'un sous-répertoire
# exécuter 'cd sous-répertoire'
setopt auto_cd
# L'exécution de "cd" met le répertoire d'où l'on vient sur la pile
setopt auto_pushd
# Ignore les doublons dans la pile
setopt pushd_ignore_dups
# N'affiche pas la pile après un "pushd" ou "popd"
setopt pushd_silent
# "pushd" sans argument = "pushd $HOME"
setopt pushd_to_home

# Les jobs qui tournent en tâche de fond sont nicé à '0'
unsetopt bg_nice
# N'envoie pas de "HUP" aux jobs qui tourent quand le shell se ferme
unsetopt hup

# BUG Corriged (NiCH2O) [ligne bouffee]
unsetopt PROMPT_CR


#
# 4. Paramètres de l'historique des commandes
#

# Nombre d'entrées dans l'historique
export HISTORY=100000000
export SAVEHIST=100000000
export HISTSIZE=10000000000000
# Fichier où est stocké l'historique
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
# 5. Complétion des options des commandes
#

# zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}'
# zstyle ':completion:*' max-errors 3 numeric
# zstyle ':completion:*' use-compctl false

autoload -U compinit
compinit -i

# Prompts for confirmation after 'rm *' etc
# Helps avoid mistakes like 'rm * o' when 'rm *.o' was intended
setopt RM_STAR_WAIT

pman () {
    man -t "${1}" | open -f -a /Applications/Preview.app
}

### Added by the Heroku Toolbelt
#export PATH="/usr/local/heroku/bin:$PATH"

canalPlayer () {
    rtmpdump -r "${1}" --quiet | "mplayer" -cache 8192 -
}
