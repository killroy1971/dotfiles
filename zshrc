# Path to your oh-my-zsh installation.
if [ -d $HOME/.oh-my-zsh ]; then export ZSH=$HOME/.oh-my-zsh; fi

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="juanghurtado"

plugins=(git)

# User configuration

if [ -d $HOME/bin ]; then export PATH=$HOME/bin:$PATH; fi

if [ -f $ZSH/oh-my-zsh.sh ]; then source $ZSH/oh-my-zsh.sh; fi

export LANG=en_US.UTF-8

setopt no_bare_glob_qual

if [ -x /usr/bin/vim ]; then
  export EDITOR='vim'
else
  export EDITOR='vi'
fi

alias gvim='mintty vim &'
alias ls='/bin/ls -F'
alias ll='/bin/ls -Flh'
alias la='/bin/ls -Fa'
alias df='/bin/df -h'
alias rm='/bin/rm -i'
alias cp='/bin/cp -i'
alias mv='/bin/mv -i'
alias grep='/bin/grep --color'

# Add color to grep
alias grep='grep --color'
alias igrep='grep --color -i'

if [ -x /usr/bin/vim ]; then alias vi='/usr/bin/vim'; fi
if [ -x /usr/local/bin/mvim ]; then alias gvim='/usr/local/bin/mvim'; fi

# Add AWS CLI Z-Shell completion in OSX if the awscli file is available
if [[ -f /usr/local/share/zsh/site-functions/_aws ]]; then
  source /usr/local/share/zsh/site-functions/_aws
fi

case "$OSTYPE" in
  darwin*)
    if [ -x /usr/local/bin/gsed ]; then alias sed='/usr/local/bin/gsed'; fi
    if [ -x /usr/local/bin/gsha1sum ]; then alias sha1sum='/usr/local/bin/gsha1sum'; fi
    if [ -x /usr/local/bin/gsha256sum ]; then alias sha256sum='/usr/local/bin/gsha256sum'; fi
    if [ -x /usr/local/bin/gsha512sum ]; then alias sha512sum='/usr/local/bin/gsha512sum'; fi
    if [ -x /usr/local/bin/gsort ]; then alias sort='/usr/local/bin/gsort'; fi
    if [ -x /usr/local/bin/gsplit ]; then alias split='/usr/local/bin/gsplit'; fi
  ;;
esac

if [ -x /bin/wslpath ]; then cd $HOME; fi

if [ -f $HOME/.ssh/id_rsa ]; then
  if [ -x /usr/bin/keychain ]; then eval `keychain --eval --quiet`; fi
  if [ -x /usr/local/bin/keychain ]; then eval `keychain --eval --quiet`; fi
fi

# Perform tasks during a login shell
if [ "$PS1" ]; then
  parent=$(ps -o ppid= -p $$ | awk '{$1=$1};1')
  name=$(ps -o comm= -p $parent)
  if [ -x /usr/bin/tmux ]; then
    case "$name" in zsh ) exec tmux ;; esac
  fi
fi
