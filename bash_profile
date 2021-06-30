# ~/.bash_profile: executed by bash for login shells.
#!/bin/bash

# the default umask is set in /etc/profile
umask 022

# Set up initial path statment:
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin

# source the system wide bashrc if it exists
if [ -f /etc/bash.bashrc ]; then 
  source /etc/bash.bashrc
elif [ -f /etc/bashrc ]; then 
  source /etc/bashrc
fi
  
# Add the snap binary path if it exists
 test -d "/var/lib/snapd/snap/bin" && PATH=${PATH}:/var/lib/snapd/snap/bin

# Add the /opt/bin path if this system is using opkg (i.e. QNAP NAS)
 test -e "/opt/bin/opkg" && PATH=/opt/bin:${PATH}

# Set PATH so it includes user's private bin if it exists
 test -d "${HOME}/bin" && PATH=${HOME}/bin:${PATH}

# Set MANPATH so it includes users' private man if it exists
  test -d "${HOME}/man" && MANPATH=${HOME}/man:${MANPATH}
 
# Set INFOPATH so it includes users' private info if it exists
  test -d "${HOME}/info" && INFOPATH=${HOME}/info:${INFOPATH}

# Add oc-cluster-wrapper to PATH if it exists
 test -d "${HOME}/oc-cluster-wrapper" && PATH=${PATH}:${HOME}/oc-cluster-wrapper:

# Add local directory to PATH - leave this after other PATH add-ons
PATH=${PATH}:.

# Fedora machines
  if [ -f /etc/fedora-release ]; then export VAGRANT_DEFAULT_PROVIDER=virtualbox; fi

# Add items to path if on a Windows machine
  if [ -d "/drives/c/Program Files/Oracle/VirtualBox"/ ]; then
    PATH="/drives/c/Program Files/Oracle/VirtualBox/":${PATH}
  fi
  if [ -d "/drives/c/HashiCorp/Vagrant/bin/" ]; then
    EMBEDDEDDIR="/drives/c/HashiCorp/Vagrant/embedded/"
    PATH="/drives/c/HashiCorp/Vagrant/bin/":${PATH}
    PATH=${PATH}:${EMBEDDEDDIR}/bin:${EMBEDDEDDIR}/gnuwin32/bin
  fi
# Export all of these environment varriables
export MANPATH INFOPATH PATH
 
#Set a few default options
LANG=en_US.UTF-8 # set language to US english
umask 022 # set default file permissions
shopt -s cdspell # spell check command line
complete -ef sudo # enable tab complete for sudo
set -o noclobber # protect overwriting files with cat
set -o ignoreeof
EDITOR='/usr/bin/vim'
export LANG EDITOR

# source the users bashrc if it exists
 if [ -f "${HOME}/.bashrc" ]; then source "${HOME}/.bashrc"; fi

# Do things that are specific to the installed OS and
# Activate SSH-Agent via Keychain (if installed) to eliminate
# the use of passwords and passphrases during interactive and
# non-interactive OpenSSH logins.
case "$OSTYPE" in
darwin*)
  if [ -x /usr/local/bin/keychain ]; then
   keychain -q ~/.ssh/id_rsa
   source ~/.keychain/${HOSTNAME}-sh
  fi
;;
cygwin)
  if [ -x /bin/keychain ] || [ -x /usr/bin/keychain ]; then
   keychain -Q -q ~/.ssh/id_rsa
   source "${HOME}/.keychain/${HOSTNAME}-sh"
  fi
;;
*)
  if [ -x /usr/bin/keychain ]; then
   keychain -q ~/.ssh/id_rsa
   source ~/.keychain/${HOSTNAME}-sh
 else
     ssh-add -l 2> /dev/null
     if [ $? == 2 ]; then eval `ssh-agent -s`; fi
     if [ -f ${HOME}/.ssh/redhat.pem ]; then ssh-add ~/.ssh/redhat.pem; fi
  fi
;;
esac

