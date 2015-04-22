# .PHONY:	all
DOTPATH=${HOME}/Projects/Dotfiles

all: ~/.ackrc ~/.bash_profile ~/.bashrc ~/.gitconfig ~/.stove ~/.tmux.conf ~/.vimrc ~/.enscriptrc binner ~/.git-prompt.sh

~/.%: %.in
	install $< $@

~/.tmp:
	install -d $@ -m 0700

~/.puppet/puppet.conf: $(DOTPATH)/puppet.conf ~/.puppet
	install $< $@

~/.puppet:
	install -d $@ -m 0700

binner:
	chef-apply binner.rb


## Symlinks didn't work out, can't recall why:
#~/dotfiles: $(DOTPATH)
#	ln -s $(DOTPATH) $(HOME)/dotfiles
#
