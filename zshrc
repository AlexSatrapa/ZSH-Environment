#
# Alex's ZSH environment
#
#  vim: ts=3 sw=3 noet 
#

uptime

if [ -z "$HOSTNAME" ] ; then
	echo -n "Checking hostname ..."
	HOSTNAME=`/bin/hostname -s`
	echo " name is $HOSTNAME."
	export HOSTNAME
fi

OSNAME=`uname`

if [ $OSNAME = 'Darwin' ] ; then
	alias ls="ls -G"
	alias ll="ls -G -l"
	alias lsl="ls -G -l"
else
	alias ls="ls --color=auto"
	alias ll="ls --color=auto -l"
	alias lsl="ls --color=auto -l"
fi
alias lsd="echo Stop tripping, man!"
alias LS="echo 'TURN CAPS LOCK OFF, YOU EEDIOT!'"
alias less="less -M"
alias svndiff='svn diff | colordiff | less -RM'
export GREP_OPTIONS=--color=auto
export GREP_COLOR=1

PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin

# Add path elements for my Macintosh computers
if [ -d $HOME/Applications ] ; then
	PATH=$PATH:$HOME/Applications
fi

export PAGER="/usr/bin/less -MR"

setopt AUTO_LIST
setopt APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_VERIFY
setopt HIST_NO_STORE
setopt SHARE_HISTORY
setopt MARK_DIRS
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS

DIRSTACKSIZE=20
HISTFILE=$HOME/.zsh_history
HISTSIZE=2000
SAVEHIST=2000
if [ $OSNAME = 'Darwin' ] ; then
	export EDITOR=`which bbedit`" -w --resume"
	export VISUAL=`which bbedit`" -w --resume"
fi
export DIRSTACKSIZE HISTFILE HISTSIZE SAVEHIST

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

