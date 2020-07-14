#------------------------------------------------------------------------------
# Config Makefile
#------------------------------------------------------------------------------

HOST_CONFIG_SOURCE_PATH := ${HOST_SOURCE_PATH}/config-files

#------------------------------------------------------------------------------

config-install: config-bash-install config-terminator-install config-xfce-install ##@config-files install system config files

config-bash-install:
	cp ~/.bashrc{,.back}
	test ! -e ~/.bash_aliases || cp ~/.bash_aliases{,.back}
	test ! -e ~/.bash_completion || cp ~/.bash_completion{,.back}
	cp ${HOST_CONFIG_SOURCE_PATH}/bash/bashrc ~/.bashrc
	cp ${HOST_CONFIG_SOURCE_PATH}/bash/bash_aliases ~/.bash_aliases
	cp ${HOST_CONFIG_SOURCE_PATH}/bash/bash_completion  ~/.bash_completion
	cp ${HOST_CONFIG_SOURCE_PATH}/bash/bash_extra ~/.bash_extra
	cp ${HOST_CONFIG_SOURCE_PATH}/bash/bash_functions ~/.bash_functions

config-terminator-install:
	test ! -e ~/.config/terminator/config || cp /.config/terminator/config{,.back}
	test -e ~/.config/terminator/config || mkdir -p ~/.config/terminator/
	cp ${HOST_CONFIG_SOURCE_PATH}/terminator/config ~/.config/terminator/

config-xfce-install:
	cp ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml{,.back}
	cp ${HOST_CONFIG_SOURCE_PATH}/xfce/xfce4-keyboard-shortcuts.xml ~/.config/xfce4/xfconf/xfce-perchannel-xml/

#------------------------------------------------------------------------------

config-reset: config-bash-reset config-terminator-reset config-xfce-reset ##@config-files reset system config files

config-bash-reset:
	mv ~/.bashrc{.back,}
	test ! -e ~/.bash_aliases.back || mv ~/.bash_aliases{.back,}
	test -e ~/.bash_aliases.back || rm ~/.bash_aliases
	test ! -e ~/.bash_completion.back || mv ~/.bash_completion{.back,}
	test -e ~/.bash_completion.back || rm ~/.bash_completion
	rm ~/.bash_extra
	rm ~/.bash_functions

config-terminator-reset:
	test ! -e ~/.config/terminator/config.back || cp ~/.config/terminator/config{.back,}
	test -e ~/.config/terminator/config.back || rm ~/.config/terminator/config

config-xfce-reset:
	cp ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml{.back,}

#------------------------------------------------------------------------------

.PHONY: config-install config-reset
# .SILENT: config-bash-install
