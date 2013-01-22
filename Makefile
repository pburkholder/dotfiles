.PHONY:	all
#DOTPATH=/Users/pburkholder/Projects/3rdParty/pburkholder.com/dotfiles
DOTPATH=${HOME}/Dotfiles

#all: ~/.bashrc ~/.vimrc ~/.screenrc ~/.csshrc ~/.rpmmacros ~/.muttrc
#all: ~/.bashrc ~/.vimrc ~/.screenrc ~/.tmp 
all: ~/.vimrc ~/.screenrc ~/.tmp ~/.profile

#~/dotfiles: $(DOTPATH)
#	ln -s $(DOTPATH) $(HOME)/dotfiles
#

~/.bashrc: $(DOTPATH)/_bashrc 
	install $< $@
	. $@

~/.profile: $(DOTPATH)/_profile
	install $< $@

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

~/.tmux.conf: $(DOTPATH)/_tmux.conf
	install $< $@

~/.puppet/puppet.conf: $(DOTPATH)/puppet.conf ~/.puppet
	install $< $@

~/.puppet:
	install -d $@ -m 0700

~/.tmp:
	install -d $@ -m 0700
