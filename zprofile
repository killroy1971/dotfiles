# Set up initial path statment:
  export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:.

# Add the /opt/bin path if this system is using opkg (i.e. QNAP NAS)
  if [ -e "/opt/bin/opkg" ]; then PATH=/opt/bin:${PATH}; fi

# Set PATH so it includes user's private bin if it exists
  if [ -d "${HOME}/bin" ]; then PATH=${HOME}/bin:${PATH}; fi

# Set MANPATH so it includes users' private man if it exists
  if [ -d "${HOME}/man" ]; then MANPATH=${HOME}/man:${MANPATH}; fi
 
# Set INFOPATH so it includes users' private info if it exists
  if [ -d "${HOME}/info" ]; then INFOPATH=${HOME}/info:${INFOPATH}; fi

# Add oc-cluster-wrapper to PATH if it exists
  if [ -d "${HOME}/oc-cluster-wrapper" ]; then PATH=${PATH}:${HOME}/oc-cluster-wrapper; fi

# Add items to path if on a Windows machine (CYGWIN)
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
 
# Fedora machines
  if [ -f /etc/fedora-release ]; then export VAGRANT_DEFAULT_PROVIDER=virtualbox; fi

#Set a few default options
LANG=en_US.UTF-8 # set language to US english
export LANG 
if [ -x /usr/bin/vim ]; then
    EDITOR='/usr/bin/vim'
  else
    EDITOR='/bin/vi'
fi
export EDITOR
umask 022 # set default file permissions
setopt correct # spell check command line
setopt noclobber # protect overwriting files with cat
setopt ignoreeof
alias scp='noglob scp'
alias ssh='noglob ssh'

# Do things that are specific to the installed OS and
# Activate SSH-Agent via Keychain (if installed) to eliminate
# the use of passwords and passphrases during interactive and
# non-interactive OpenSSH logins.
case "$OSTYPE" in
darwin*)
  if [ -x /usr/local/bin/keychain ]; then
   keychain -q ~/.ssh/id_rsa
  fi
;;
cygwin)
  if [ -x /bin/keychain ] || [ -x /usr/bin/keychain ]; then
   keychain -Q -q ~/.ssh/id_rsa
  fi
;;
*)
  if [ -x /usr/bin/keychain ]; then
   keychain -q ~/.ssh/id_rsa
 else
     ssh-add -l 2> /dev/null
     if [ $? = 2 ]; then eval `ssh-agent -s`; fi
     if [ -f ${HOME}/.ssh/redhat.pem ]; then ssh-add ~/.ssh/redhat.pem; fi
  fi
;;
esac

# Load SSH Key 
case "$OSTYPE" in
  darwin*)
    if [ -x /usr/local/bin/keychain ]; then
      keychain -q ~/.ssh/id_rsa
    else
      ssh-add -l > /dev/null
      if [ $? = 2 ]; then eval `ssh-agent -s`; fi
      ssh-add -l > /dev/null
      if [ $? = 1 ]; then ssh-add ~/.ssh/id_rsa; fi
    fi
    ;;
  cygwin)
    if [ -x /bin/keychain ] || [ -x /usr/bin/keychain ]; then
      keychain -Q -q ~/.ssh/id_rsa
    else
      ssh-add -l > /dev/null
      if [ $? = 2 ]; then eval `ssh-agent -s`; fi
      ssh-add -l > /dev/null
      if [ $? = 1 ]; then ssh-add ~/.ssh/id_rsa; fi
    fi
    ;;
  *)
    if [ -x /usr/bin/keychain ]; then
      keychain -Q -q ~/.ssh/id_rsa
    else
      ssh-add -l > /dev/null
      if [ $? = 2 ]; then eval `ssh-agent -s`; fi
      ssh-add -l > /dev/null
      if [ $? = 1 ]; then ssh-add ~/.ssh/id_rsa; fi
    fi
    ;;
esac

