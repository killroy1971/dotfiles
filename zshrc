# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="babun"

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

# Add color to grep
alias grep='grep --color'
alias igrep='grep --color -i'

if [ -x /usr/bin/vim ]; then alias vi='/usr/bin/vim'; fi
if [ -x /usr/local/bin/mvim ]; then alias gvim='/usr/local/bin/mvim'; fi

# Add AWS CLI Z-Shell completion in OSX if the awscli file is available
if [[ -f /usr/local/share/zsh/site-functions/_aws ]]; then
  source /usr/local/share/zsh/site-functions/_aws
fi

#if [[ ${CYGWIN_VERSION} == "x86" ]] && [[ -f /opt/ansible/hacking/env-setup ]]; then
#  source /opt/ansible/hacking/env-setup
#  export ANSIBLE_LIBRARY=$ANSIBLE_HOME/library
#  export ANSIBLE_SSH_ARGS="-o ControlMaster=no"
#fi

# Load SSH Key 
case "$OSTYPE" in
  darwin*)
    if [ -x /usr/local/bin/keychain ]; then
      keychain -q ~/.ssh/id_rsa
      source ~/.keychain/${HOSTNAME}-sh
    else
      ssh-add -l > /dev/null
      if [ $? == 2 ]; then eval `ssh-agent -s`; fi
      ssh-add -l > /dev/null
      if [ $? == 1 ]; then ssh-add ~/.ssh/id_rsa; fi
    fi
    ;;
  cygwin)
    if [ -x /bin/keychain ] || [ -x /usr/bin/keychain ]; then
      keychain -Q -q ~/.ssh/id_rsa
      source ~/.keychain/${HOSTNAME}-sh
    else
      ssh-add -l > /dev/null
      if [ $? == 2 ]; then eval `ssh-agent -s`; fi
      ssh-add -l > /dev/null
      if [ $? == 1 ]; then ssh-add ~/.ssh/id_rsa; fi
    fi
    ;;
  *)
    if [ -x /usr/bin/keychain ]; then
      keychain -Q -q ~/.ssh/id_rsa
      source ~/.keychain/${HOSTNAME}-sh
    else
      ssh-add -l > /dev/null
      if [ $? == 2 ]; then eval `ssh-agent -s`; fi
      ssh-add -l > /dev/null
      if [ $? == 1 ]; then ssh-add ~/.ssh/id_rsa; fi
    fi
    ;;
esac

 
