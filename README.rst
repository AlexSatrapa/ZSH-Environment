README
======

This collection of code is an esoteric and whimsical set of ZSH scripts to set up my environment the way I like it, across Mac OS X and Linux.

It is by no means complete. Please feel free to contribute your changes.

Alex Satrapa <grail@goldweb.com.au>

DEPENDENCIES
============

FIXME: On the Mac, you are expected to have MacPorts installed. This is mainly so I can use the shortcut to find where the virtualenvwrapper.sh for the currently installed Python is located. At some later point in time I'll update this to find where virtualenvwrapper.sh is installed, and preferably not be fragile about it.

INSTALLING
==========

To get started:
 - clone from github: git clone git://github.com/AlexSatrapa/ZSH-Environment.git ~/.zsh.d
 - symlink ~/.zsh.d/zshrc to ~/.zshrc
 - in .zsh.d, symlink all the scripts you want to have active to files with names of the form XX_Foo where XX is some number 00-99.
 - source ~/.zshrc

NB: instead of ~/.zsh.d I like to use ~/Documents/GitHub/ZSH-Environment, and edit the zshrc script appropriately.