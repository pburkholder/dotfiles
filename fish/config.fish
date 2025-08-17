# Add HomeBrew's bin directory to path so you can use HomeBrew's binaries like `starship`
# Fish uses `fish_add_path` instead of `export PATH` modify $PATH.
fish_add_path "/opt/homebrew/bin/"
fish_add_path "$HOME/bin"

source $HOME/.config/fish/conf.d/cloud-gov

if status is-interactive
  # Enable Starship prompt
  function startship_precmd_user_fund
    cf_target
  end

  starship init fish | source
  pip3 config set global.cert $(brew --prefix)/etc/ca-certificates/cert.pem
    # Commands to run in interactive sessions can go here

  source (pack completion --shell fish)

  function ssh-piv
    export OSXSC_LIB=/usr/lib/ssh-keychain.dylib
    [ ( count $argv ) -gt 0 ] && ssh-add -d -s $OSXSC_LIB
    ssh-add -s $OSXSC_LIB
  end

  function lh
    /bin/ls -lt $argv | /usr/bin/head
  end

  function p
    pushd $argv[1];
  end

  function P
    popd $argv[1]; 
  end

  alias g="git"
  alias mroe='more'
  alias m='more'
  alias ls='/bin/ls -F'
  alias ll='/bin/ls -l'
  alias cg='cd ~/Projects/cloud-gov/'
  alias cg-scripts='cd ~/Projects/cloud-gov/cg-scripts'

  alias wordle='curl -s https://gist.githubusercontent.com/bklaas/5f93da478e01af48016c1f3b5025281c/raw/485b2ed5e6d1f33e4041bc56809f0ea8cb0952b2/gistfile1.txt'
  alias myip='dig +short myip.opendns.com @resolver1.opendns.com'
end

# Python and ZScaler:
export CERT_PATH=$(brew --prefix)/etc/ca-certificates/cert.pem
export CERT_DIR=$(brew --prefix)/etc/ca-certificates
export SSL_CERT_FILE=$CERT_PATH
export SSL_CERT_DIR=$CERT_DIR
export REQUESTS_CA_BUNDLE=$CERT_PATH

source $HOME/.tenv.completion.fish

