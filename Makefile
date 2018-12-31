# .PHONY:	all

BIN := ~/bin/ ~/bin/vmrun  ~/bin/aws_switch ~/bin/aws_emit
VSCODE_SETTTINGS := $(HOME)/Library/Application\ Support/Code/User/settings.json

all: ~/.ackrc ~/.bash_profile ~/.bashrc ~/.gitconfig ~/.stove ~/.tmux.conf ~/.vimrc ~/.enscriptrc ~/.git-prompt.sh $(BIN) brewnote

.PHONY: brewnote
brewnote:
	@echo "run 'brew bundle install Brewfile' to install"

# code --list-extensions | xargs -L1 echo code --install-extension
.PHONY: vscode vscode-extensions
vscode: vscode-extensions $(VSCODE_SETTTINGS)

$(VSCODE_SETTTINGS): vscode-settings.json
	install -b $< \"$@\"

vscode-extensions:
	code --install-extension DavidAnson.vscode-markdownlint
	code --install-extension flesler.url-encode
	code --install-extension jetmartin.bats
	code --install-extension marvhen.reflow-markdown
	code --install-extension mauve.terraform
	code --install-extension ms-python.python
	code --install-extension ms-vscode.csharp
	code --install-extension ms-vscode.Go
	code --install-extension ms-vscode.PowerShell
	code --install-extension PeterJausovec.vscode-docker
	code --install-extension rebornix.ruby
	code --install-extension redhat.java
	code --install-extension streetsidesoftware.code-spell-checker
	code --install-extension timonwong.shellcheck
	code --install-extension vscodevim.vim
	code --install-extension vstirbu.vscode-mermaid-preview
	code --install-extension yzane.markdown-pdf

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


#DOTPATH=${HOME}/Projects/dotfiles
## Symlinks didn't work out, can't recall why:
#~/dotfiles: $(DOTPATH)
#	ln -s $(DOTPATH) $(HOME)/dotfiles
#
