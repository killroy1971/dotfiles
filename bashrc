# Glenn's cross-platform .bashrc file
# This .bashrc file will work in a linux, OSX, or a cygwin bash shell.

# Cygwin Note:
# The default cygwin user .bashrc file: /etc/defaults/etc/skel/.bashrc
# Modifying /etc/skel/.bashrc directly will prevent setup from updating it.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# ##################
# Shell options
# ##################

#Fix an issue with Ubuntu/Debian where terminal type is 'xterm'
if [ -f /usr/share/vim/vim74/debian.vim ]; then
    if [ ${TERM} == "xterm" ]; then export TERM=xterm-256color; fi
fi

# Correct small typos in directory paths
shopt -s cdspell

# Set vi-like behavior for bash
set -o vi

# Ignore duplicate entries in the history
export HISTCONTROL=ignoredups

# Check window size after each command and update the LINES
# and COLUMNS settings
shopt -s checkwinsize

# Make 'less' more user-friendly for non-text files
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# Set some 'ls' command options
 LS_OPTIONS='--group-directories-first -h'
 export LS_OPTIONS

# ##################
# OS options
# ##################

# enable color support of ls and also add handy aliases specific to each os type
case "$OSTYPE" in
darwin*)
# Set Prompt 
# PROMPT_COMMAND='CurDir=`pwd|sed -e "s!$HOME!~!"|sed -Ee "s!([^/])[^/]+/!\1/!g"`'
# PS1='\[\033[01;32m\][$CurDir]\n\[\033[01;32m\]\u@\h $\[\033[0m\] '
  PS1='\[\033[01;32m\]\w\n\[\033[01;32m\]\u@\h $\[\033[0m\] '
# Set Aliases
    export CLICOLOR=1
 	  export LSCOLORS=GxFxCxDxBxegedabagaced
    alias ls='ls -G -F -h'
    alias ll='ls -l -G -F -h'
    alias la='ls -A -G -F -h'
    alias lla='ls -l -A -G -F -h'
    alias dir='ls -G -x -h'
    alias vdir='ls -G -l -h'
    if [ -x /usr/local/bin/gsed ]; then alias sed='/usr/local/bin/gsed'; fi
    if [ -x /usr/local/bin/gmd5sum ]; then alias md5sum='/usr/local/bin/gmd5sum'; fi
    if [ -x /usr/local/bin/gsha1sum ]; then alias sha1sum='/usr/local/bin/gsha1sum'; fi
    if [ -x /usr/local/bin/gsha256sum ]; then alias sha256sum='/usr/local/bin/gsha256sum'; fi
    if [ -x /usr/local/bin/gsha512um ]; then alias sha512sum='/usr/local/bin/gsha512sum'; fi
;;
cygwin)
# Set Prompt 
# PROMPT_COMMAND='CurDir=`pwd|sed -e "s!$HOME!~!"|sed -re "s!([^/])[^/]+/!\1/!g"`'
# PS1='\[\033[01;32m\][$CurDir]\n\[\033[01;32m\]\u@\h $\[\033[0m\] '
  PS1='\[\033[01;32m\]\w\n\[\033[01;32m\]\u@\h $\[\033[0m\] '
  # PS1='[$CurDir]\n\u@\h: $: '
# Set Aliases
    alias ls='ls --color=auto -F -h'
    alias ll='ls -l -h'                              # long list
    alias la='ls -A -h'                              # all but . and ..
    alias lla='ls -lA -h'                            # long list of all but . and ..
;;
*)
# Set Prompt 
# PROMPT_COMMAND='CurDir=`pwd|sed -e "s!$HOME!~!"|sed -re "s!([^/])[^/]+/!\1/!g"`'
# PS1='\[\033[01;32m\][$CurDir]\n\[\033[01;32m\]\u@\h $\[\033[0m\] '
  PS1='\[\033[01;32m\]\w\n\[\033[01;32m\]\u@\h $\[\033[0m\] '
  # PS1='[$CurDir]\n\u@\h: $: '
# Set Aliases
    eval `dircolors -b`
    alias ls='ls --color=auto -F -h'
    alias dir='ls --color=auto --format=vertical -h'
    alias vdir='ls --color=auto --format=long -h'
    alias ll='ls -l -h'                              # long list
    alias la='ls -A -h'                              # all but . and ..
    alias lla='ls -lA -h'                            # long list of all but . and ..
    if [ -x "${HOME}/oc-cluster-wrapper/oc-cluster" ]; then alias oc-cluster='${HOME}/oc-cluster-wrapper/oc-cluster'; fi
;;
esac

# ##################
# Universal Aliases
# ##################

# Make destructive commands safer with verification
 alias rm='/bin/rm -i'
 alias cp='/bin/cp -i'
 alias mv='/bin/mv -i'

# Use human readable figures
 alias df='/bin/df -h'
 if [ -x /usr/bin/du ]; then alias du='/usr/bin/du -h'; else alias du='/bin/du -h'; fi

# Add some color to grep
 alias grep='grep --color'                     # show differences in colour
 alias igrep='grep --color -i'                 # show differences in colour and ignore case

# Use vim if available
if [ -x /usr/bin/vim ]; then alias vi='/usr/bin/vim'; fi

# OS specific aliases
if [ -x '/usr/local/bin/mvim' ]; then alias gvim='/usr/local/bin/mvim'; fi

# Settler01 aliases
#if [ $USER == "glenn" ]; then 
  alias coreos-installer='podman run --pull=always            \
                          --rm --tty --interactive            \
                          --security-opt label=disable        \
                          --volume ${PWD}:/pwd --workdir /pwd \
                          quay.io/coreos/coreos-installer:release'

  alias ignition-validate='podman run --rm --tty --interactive \
                           --pull=always --security-opt label=disable        \
                           --volume ${PWD}:/pwd --workdir /pwd \
                           quay.io/coreos/ignition-validate:release'

  alias fcct='podman run --rm --tty --interactive \
              --pull=always --security-opt label=disable \
              --volume ${PWD}:/pwd --workdir /pwd \
              quay.io/coreos/fcct:release'

#If Windows OS, change to home directory
if [ ! -z $WSL_DISTRO_NAME ]; then cd $HOME; fi

if [ -f ${HOME}/.ssh/id_rsa ]; then
  if [ -x /usr/bin/keychain ]; then eval `keychain --eval --quiet`; fi 
  if [ -x /usr/local/bin/keychain ]; then eval `keychain --eval --quiet`; fi
fi


# ##################
# Welcome Screen
# ##################
echo -ne "This system's name is: "; hostname
echo -e "";
echo -ne "Today is "; date
echo -e "";

