.PHONY:	all

all: ~/.bashrc ~/.vimrc ~/.screenrc ~/.csshrc ~/.rpmmacros ~/.muttrc

~/.bashrc:	~/dotfiles/_bashrc
	install $< $@
	. $@

~/.csshrc: ~/dotfiles/_csshrc
	ln -s $< $@
	
~/.rpmmacros: ~/dotfiles/_rpmmacros
	ln -s $< $@

~/.screenrc: ~/dotfiles/_screenrc
	ln -s $< $@

~/.vimrc: ~/dotfiles/_vimrc
	ln -s $< $@

~/.muttrc: ~/dotfiles/_muttrc
	ln -s $< $@

~/.puppet/puppet.conf: ~/dotfiles/puppet.conf ~/.puppet
	ln -s $< $@

~/.puppet:
	install -d $@ -m 0700
