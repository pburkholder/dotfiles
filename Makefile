# .PHONY:	all

BIN := ~/bin/ ~/bin/aws_switch ~/bin/aws_emit
VSCODE_SETTTINGS := $(HOME)/Library/Application\ Support/Code/User/settings.json
ALL := ~/.ackrc ~/.bash_profile ~/.bashrc ~/.gitconfig ~/.stove ~/.tmux.conf ~/.vimrc ~/.enscriptrc ~/.git-prompt.sh $(BIN) brewnote
ALL += ~/.config/Powershell/Microsoft.PowerShell_profile.ps1
All += defaults

#:ALL += vscode-extensions

# not used: ~/bin/vmrun 

all: $(ALL)

.PHONY: defaults AppleKeyboardUIMode
defaults: AppleKeyboardUIMode

AppleKeyboardUIMode:
	defaults read -g $@ | grep -q 2 || defaults write -g $@ 2


.PHONY: brewnote
brewnote:
	@echo "run 'brew bundle install Brewfile' to install"

.PHONY: vscode-extensions install-vscode

vscode: install-vscode $(VSCODE_SETTTINGS) vscode-extensions

install-vscode:
	[ -x /usr/local/bin/code ] || brew install visual-studio-code
	defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

# need to quote as '$@' because of spaces in filename
$(VSCODE_SETTTINGS): vscode-settings.json
	install -b $< '$@' 

define extensions
DavidAnson.vscode-markdownlint 
jetmartin.bats marvhen.reflow-markdown
mauve.terraform
ms-vscode.powershell
PeterJausovec.vscode-docker
streetsidesoftware.code-spell-checker
timonwong.shellcheck
vscodevim.vim
vstirbu.vscode-mermaid-preview
yzane.markdown-pdf
yzhang.markdown-all-in-one
endef 

export extensions

vscode-extensions:
	for ex in $$extensions; do \
	  code --list-extensions | grep $$ex > /dev/null || \
	    code --install-extension $$ex; \
	done

~/.%: %.in
	install $< $@

~/.tmp:
	mkdir $@
	chmod 0700 $@

~/.config/Powershell:
	install -d $@ -m 0700

~/.config/Powershell/Microsoft.PowerShell_profile.ps1: profile.ps1 ~/.config/Powershell
	install $< $@

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
