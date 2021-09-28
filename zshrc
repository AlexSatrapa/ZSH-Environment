# Alex's ZSH environment

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

for zshrc_snippet in ~/.zsh.d/[0-9][0-9]*[^~] ; do
   source $zshrc_snippet
done
