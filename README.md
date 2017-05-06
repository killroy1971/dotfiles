#Glenn's dotfiles

My shell configuration files

This mainly covers: bash, git, and vim.

* bashrc
* bash_profile - Loads your SSH key
* bash_profile_server - Does not load an SSH key, 
  which is anoying on server you only need to use once in a while.
* profile
* vimrc
* _vimrc: For Windows-based gvim users.
* gvimrc
* vim directory: Containing my preferred vim plugins.
* gitconfig: Containing my perferred git configuration.
* gitignore: Keep things out of git that shouldn't be there.
* ssh_config: Use this as a personal ".ssh/config" file.
* Xdefaults: Because you never know when you'll need this file.
* conkyrc: I created this back in the day when I was using conky.
* zshrc: for the Z-Shell, which I'm learning to use.  
  This file came from the babun Windows package, and requires the use of "Oh-My-Zsh!"
* movein.sh: My attempt at a universal shell set up script.  
  I recommend backing up your configurations and customizing this script first!

This repository is designed to work with a content manager like ansible.
If a variable, say "is_server" is true, then make a symbolinc link
to dotfiles/bash_profile_server.  If not, make a symbolic link to 
dotfiles/bash_profile.
