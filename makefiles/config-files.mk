#------------------------------------------------------------------------------
# Config Makefile
#------------------------------------------------------------------------------

HOST_CONFIG_SOURCE_PATH := ${HOST_SOURCE_PATH}/config-files

#------------------------------------------------------------------------------

config-install: config-bash-install config-terminator-install config-xfce-install ##@config-files install system config files

config-bash-install:
	cp ~/.bashrc{,.back}
	cp ~/.bash_aliases{,.back}
	cp ~/.bash_completion{,.back}
	cp ${HOST_CONFIG_SOURCE_PATH}/bash/bashrc ~/.bashrc
	cp ${HOST_CONFIG_SOURCE_PATH}/bash/bash_aliases ~/.bash_aliases
	cp ${HOST_CONFIG_SOURCE_PATH}/bash/bash_completion  ~/.bash_completion
	cp ${HOST_CONFIG_SOURCE_PATH}/bash/bash_extra ~/.bash_extra
	cp ${HOST_CONFIG_SOURCE_PATH}/bash/bash_functions ~/.bash_functions

config-terminator-install:
	cp ~/.config/terminator/config{,.back}
	cp ${HOST_CONFIG_SOURCE_PATH}/terminator/config ~/.config/terminator/

config-xfce-install:
	cp ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml{,.back}
	cp ${HOST_CONFIG_SOURCE_PATH}/xfce/xfce4-keyboard-shortcuts.xml ~/.config/xfce4/xfconf/xfce-perchannel-xml/

#------------------------------------------------------------------------------

config-reset: config-bash-reset config-terminator-reset config-xfce-reset ##@config-files reset system config files

config-bash-reset:
	mv ~/.bashrc{.back,}
	mv ~/.bash_aliases{.back,}
	mv ~/.bash_completion{.back,}
	rm ~/.bash_extra
	rm ~/.bash_functions

config-terminator-reset:
	cp ~/.config/terminator/config{.back,}

config-xfce-reset:
	cp ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml{.back,}

#------------------------------------------------------------------------------

.PHONY: config-install config-reset
# .SILENT: config-bash-install
