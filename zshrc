# Path to your oh-my-zsh installation.
if [ -d .oh-my-zsh ]; then export ZSH=$HOME/.oh-my-zsh; fi

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="juanghurtado"

plugins=(git)

# User configuration

if [ -d $HOME/bin ]; then export PATH=$HOME/bin:$PATH; fi

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

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
    alias sed='/usr/local/bin/gsed'
    alias sha1sum='/usr/local/bin/gsha1sum'
    alias sha256sum='/usr/local/bin/gsha256sum'
    alias sha512sum='/usr/local/bin/gsha512sum'
    alias sort='/usr/local/bin/gsort'
    alias split='/usr/local/bin/gsplit'
  ;;
esac

#if [[ ${CYGWIN_VERSION} = "x86" ]] && [[ -f /opt/ansible/hacking/env-setup ]]; then
#  source /opt/ansible/hacking/env-setup
#  export ANSIBLE_LIBRARY=$ANSIBLE_HOME/library
#  export ANSIBLE_SSH_ARGS="-o ControlMaster=no"
#fi

