# .PHONY:	all
DOTPATH=${HOME}/Projects/Dotfiles

BIN := ~/bin/ ~/bin/vmrun  ~/bin/aws_switch ~/bin/aws_emit

all: ~/.ackrc ~/.bash_profile ~/.bashrc ~/.gitconfig ~/.stove ~/.tmux.conf ~/.vimrc ~/.enscriptrc ~/.git-prompt.sh $(BIN) brewnote

.PHONY: brewnote
brewnote:
	@echo "run 'brew bundle install Brewfile' to install"


~/.%: %.in
	install $< $@

~/.tmp:
	install -d $@ -m 0700

~/bin:
	install -d $@ -m 0700

~/bin/aws_switch: bin/aws_switch
	install -m 0755 $<  $@

~/bin/aws_emit: bin/aws_emit
	install -m 0755 $<  $@

~/bin/vmrun: 
	ln -fs "/Applications/VMware Fusion.app/Contents/Library/vmrun" $@




## Symlinks didn't work out, can't recall why:
#~/dotfiles: $(DOTPATH)
#	ln -s $(DOTPATH) $(HOME)/dotfiles
#
