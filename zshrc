#
# Alex's ZSH environment
# $Id$
#
#  vim: ts=3 sw=3 noet 
#

if [ -z "$HOSTNAME" ] ; then
	HOSTNAME=`/bin/hostname -s`
	export HOSTNAME
fi

uptime

alias ls="ls -G -A"
alias ll="ls -G -l -A"
alias lsl="ls -G -l -A"
alias lsd="echo Stop tripping, man!"
alias sl="echo You want \*ls\*, schmuck."
alias LS="echo 'TURN CAPS LOCK OFF, YOU EEDIOT!'"
alias less="less -M"
alias bbedit-ctags="ctags --excmd=number --tag-relative=no --fields=+a+m+n+S -R `pwd`"
alias svndiff='svn diff | colordiff | less -RM'
export GREP_OPTIONS=--color=auto
export GREP_COLOR=1

PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin

# Add path elements for my Macintosh computers
if [ -d $HOME/Applications ] ; then
	PATH=$PATH:$HOME/Applications
fi

# Move file with path
function mp
{
  SOURCE=$1
  DEST=$2
  [ -f $SOURCE ] || exit 1
  [ -d $DEST ] || exit 2
  FILE=`basename $SOURCE`
  DIR=`dirname $SOURCE`
  mkdir -p $DEST/$DIR
  mv $SOURCE $DEST/$DIR
}

export PAGER="/usr/bin/less -M"

setopt AUTO_LIST
setopt AUTO_PUSHD
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_VERIFY
setopt HIST_NO_STORE
setopt SHARE_HISTORY
setopt MARK_DIRS
setopt PUSHD_IGNORE_DUPS
#setopt RM_STAR_WAIT

WORKON_HOME=$HOME/Library/Python/VirtualEnvironments
DIRSTACKSIZE=20
HISTFILE=$HOME/.zsh_history
HISTSIZE=2000
SAVEHIST=2000
EDITOR=`which bbedit`" -w"
VISUAL=`which bbedit`" -w"
export DIRSTACKSIZE HISTFILE HISTSIZE SAVEHIST EDITOR VISUAL WORKON_HOME

bindkey -d
bindkey -e
# Macintosh "[X>" key ('delete' next to help/end)
bindkey "^[[3~" delete-char

# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' matcher-list '+r:|[. _ -]=** r:|=**'
zstyle :compinstall filename '/Users/alex/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

for zshrc_snipplet in ~/.zsh.d/S[0-9][0-9]*[^~] ; do
   source $zshrc_snipplet
done

