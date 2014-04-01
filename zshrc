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

PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin

# Add path elements for my Macintosh computers
if [ -d $HOME/Applications ] ; then
	PATH=$PATH:$HOME/Applications
fi

# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' matcher-list '+r:|[. _ -]=** r:|=**'
zstyle :compinstall filename '/Users/alex/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

for zshrc_snippet in ~/.zsh.d/[0-9][0-9]*[^~] ; do
   source $zshrc_snippet
done

