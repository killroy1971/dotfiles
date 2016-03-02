# ~/.bash_profile: executed by bash for login shells.
#!/bin/bash

# the default umask is set in /etc/profile
#umask 022

# source the system wide bashrc if it exists
if [ -e /etc/bash.bashrc ]; then 
  source /etc/bash.bashrc
elif [ -e /etc/bashrc ]; then 
  source /etc/bashrc
fi
  
# source the users bashrc if it exists
  test -e "${HOME}/.bashrc" && source "${HOME}/.bashrc"

# Set PATH so it includes user's private bin if it exists
  test -d "${HOME}/bin" && PATH=${HOME}/bin:${PATH}

# Set MANPATH so it includes users' private man if it exists
 test -d "${HOME}/man" && MANPATH=${HOME}/man:${MANPATH}
 
# Set INFOPATH so it includes users' private info if it exists
 test -d "${HOME}/info" && INFOPATH=${HOME}/info:${INFOPATH}

# Set the path for Fink (OS-X) if it exists
test -r /sw/bin/init.sh && . /sw/bin/init.sh
test -d /sw/lib/pkgconfig && export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/sw/lib/pkgconfig

# Export all of these environment varriables
export MANPATH INFOPATH PATH
 
#Set a few default options
LANG=en_US.UTF-8 # set language to US english
umask 022 # set default file permissions
shopt -s cdspell # spell check command line
complete -ef sudo # enable tab complete for sudo
set -o noclobber # protect overwriting files with cat
set -o ignoreeof
GREP_OPTIONS='--color=auto'
GREP_COLOR='1;32'
EDITOR='/usr/bin/vim'
export LANG GREP_OPTOINS GREP_COLOR EDITOR

# Do things that are specific to the installed OS and
# Activate SSH-Agent via Keychain (if installed) to eliminate
# the use of passwords and passphrases during interactive and
# non-interactive OpenSSH logins.
case "$OSTYPE" in
darwin)
   # Check configuration for the "Fink" environment
   if [ -x /sw/bin/keychain ]; then
     keychain --dir ~/.ssh
     source ~/.keychain/${HOSTNAME}-sh
   fi
   ;;
cygwin)
   if [ -x /usr/bin/keychain ]; then
     if [ -O ~/.ssh/id_rsa ]; then
       keychain -q ~/.ssh/id_rsa
       source ~/.keychain/${HOSTNAME}-sh
     fi
   fi
   ;;
#*)
#   if [ -O ~/.ssh/id_rsa ]; then
#     if [ -x /usr/bin/keychain ]; then
#       keychain -q ~/.ssh/id_rsa
#       source ~/.keychain/${HOSTNAME}-sh
#     else
#       ssh-add -l > /dev/null
#       if [ $? == 2 ]; then eval `ssh-agent -s`; fi
#       ssh-add -l > /dev/null
#       if [ $? == 1 ]; then ssh-add; fi
#     fi
#   fi
#   ;;
esac


