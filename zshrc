#
# Alex's ZSH environment
#
#  vim: ts=3 sw=3 noet
#

uptime

if [ -z "$HOSTNAME" ] ; then
	HOSTNAME=`/bin/hostname -s`
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

for zshrc_snippet in ~/.config/zsh.d/[0-9][0-9]*[^~] ; do
   source $zshrc_snippet
done

PATH="/Users/alex/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/alex/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/alex/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/alex/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/alex/perl5"; export PERL_MM_OPT;
