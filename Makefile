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
	ln -fs "/Applications/VMware Fusion.app/Contents/Library/vmrun" $@


APPS=bash-git-prompt

apps:
	for app in $(APPS); do brew install $$app; done

/Applications/iTerm.app:
	brew install Caskroom/cask/iterm2

/Applications/Atom.app:
	brew install Caskroom/cask/atom

flycut: /Applications/Flycut.app

/Applications/Flycut.app:
	brew install Caskroom/cask/flycut

alfred: /Applications/Alfred.app

/Applications/Alfred.app:
	brew install Caskroom/cask/alfred

/Applications/Sizeup.app:
	brew install Caskroom/cask/sizeup

/Applications/Rescuetime.app:
	brew install Caskroom/cask/rescuetime

/Applications/Evernote.app:
	brew install Caskroom/cask/evernote
## Symlinks didn't work out, can't recall why:
#~/dotfiles: $(DOTPATH)
#	ln -s $(DOTPATH) $(HOME)/dotfiles
#
