# .PHONY:	all
DOTPATH=${HOME}/Projects/Dotfiles


BIN := ~/bin/ ~/bin/vmrun  ~/bin/aws_switch

all: ~/.ackrc ~/.bash_profile ~/.bashrc ~/.gitconfig ~/.stove ~/.tmux.conf ~/.vimrc ~/.enscriptrc ~/.git-prompt.sh ~/.secrets $(BIN)

~/.%: %.in
	install $< $@

~/.tmp:
	install -d $@ -m 0700

~/.puppet/puppet.conf: $(DOTPATH)/puppet.conf ~/.puppet
	install $< $@

~/.puppet:
	install -d $@ -m 0700

~/bin:
	install -d $@ -m 0700

~/bin/aws_switch: bin/aws_switch
	install -m 0755 $<  $@

~/bin/vmrun: 
	ln -s "/Applications/VMware Fusion.app/Contents/Library/vmrun" $@


## Symlinks didn't work out, can't recall why:
#~/dotfiles: $(DOTPATH)
#	ln -s $(DOTPATH) $(HOME)/dotfiles
#
