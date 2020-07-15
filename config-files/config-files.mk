#------------------------------------------------------------------------------
# Config Makefile
#------------------------------------------------------------------------------

HOST_CONFIG_SOURCE_PATH := ${HOST_SOURCE_PATH}/config-files

#------------------------------------------------------------------------------

config-install: config-bash-install config-terminator-install config-xfce-install ##@config-files install all system config files

config-bash-install: ##@config-files install bash config files
	cp ~/.bashrc{,.back}
	test ! -e ~/.bash_aliases || cp ~/.bash_aliases{,.back}
	test ! -e ~/.bash_completion || cp ~/.bash_completion{,.back}
	cp ${HOST_CONFIG_SOURCE_PATH}/bash/bashrc ~/.bashrc
	cp ${HOST_CONFIG_SOURCE_PATH}/bash/bash_aliases ~/.bash_aliases
	cp ${HOST_CONFIG_SOURCE_PATH}/bash/bash_completion  ~/.bash_completion
	cp ${HOST_CONFIG_SOURCE_PATH}/bash/bash_extra ~/.bash_extra
	cp ${HOST_CONFIG_SOURCE_PATH}/bash/bash_functions ~/.bash_functions

config-git-install: #@config-files install git config files
	test ! -e ~/.gitconfig || cp ~/.gitconfig{,.back}
	cp ${HOST_CONFIG_SOURCE_PATH}/git/gitconfig ~/.gitconfig

config-terminator-install: ##@config-files install terminator config files
	test ! -e ~/.config/terminator/config || cp /.config/terminator/config{,.back}
	test -e ~/.config/terminator/config || mkdir -p ~/.config/terminator/
	cp ${HOST_CONFIG_SOURCE_PATH}/terminator/config ~/.config/terminator/

config-xfce-install: ##@config-files install xfce config files
	cp ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml{,.back}
	cp ${HOST_CONFIG_SOURCE_PATH}/xfce/xfce4-keyboard-shortcuts.xml ~/.config/xfce4/xfconf/xfce-perchannel-xml/

#------------------------------------------------------------------------------

.PHONY: config-install config-bash-install config-terminator-install config-xfce-install
# .SILENT: config-bash-install
