.PHONY:	all
DOTPATH=/Users/pburkholder/Projects/3rdParty/pburkholder.com/dotfiles

#all: ~/.bashrc ~/.vimrc ~/.screenrc ~/.csshrc ~/.rpmmacros ~/.muttrc
all: ~/.bashrc ~/.vimrc ~/.screenrc ~/.tmp 

#~/dotfiles: $(DOTPATH)
#	ln -s $(DOTPATH) $(HOME)/dotfiles
#

~/.bashrc: $(DOTPATH)/_bashrc 
	install $< $@
	. $@

~/.csshrc: $(DOTPATH)/_csshrc
	install $< $@
	
~/.rpmmacros: $(DOTPATH)/_rpmmacros
	install $< $@

~/.screenrc: $(DOTPATH)/_screenrc
	install $< $@

~/.vimrc: $(DOTPATH)/_vimrc
	install $< $@

~/.muttrc: $(DOTPATH)/_muttrc
	install $< $@

~/.puppet/puppet.conf: $(DOTPATH)/puppet.conf ~/.puppet
	install $< $@

~/.puppet:
	install -d $@ -m 0700

~/.tmp:
	install -d $@ -m 0700
