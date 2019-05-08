# How to make my Mac a dev env, again.

```
# install brew:
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# set this up
mkdir -p ~/Projects/pburkholder
cd ~/Projects/pburkholder
git clone https://github.com/pburkholder/dotfiles.git
cd dotfiles

# make
make
```

# To do:

Set up startup items with:

```

osascript -e 'tell application "System Events" to make login item at end with properties {path:"/path/to/itemname", hidden:false}'

osascript -e 'tell application "System Events" to get the name of every login item'
```
