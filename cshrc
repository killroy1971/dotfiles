# My cshrc file for C-Shell
# 6 January 2013

alias setprompt 'set prompt=$cwd \\
$user@`uname -n`> "'
alias cd 'chdir \!* && setprompt'
setprompt
alias ls '/bin/ls -F'
alias la '/bin/ls -aF'
alias ll '/bin/ls -l'
alias lla '/bin/ls -la'
alias du '/bin/du -h'
alias df '/bin/df -h'
alias igrep '/bin/grep -i'

setenv EDITOR /usr/bin/vim
setenv PAGER /usr/bin/more

