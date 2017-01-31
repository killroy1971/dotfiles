#!/bin/bash
# This script will remove existing bash shell config files, git config files, and vim config files, and replace them with symbolic links to this directory.
# Glenn H. Snead
# 26 Jun 2016

# For Windows GVIM:
# Install Git for Windows and use the minitty terminal
# Once you have downloaded the dotfiles repository,
# Create symbolic links to _vimrc, then
# %USREPROFILE%/vimfiles instead of ".vim"


if [ -d ${HOME}/.vim ]; then /bin/rm -Rf ${HOME}/.vim; fi
if [ -f ${HOME}/.vimrc ]; then /bin/rm -f ${HOME}/.vimrc; fi
if [ -f ${HOME}/.gvimrc ]; then /bin/rm -f ${HOME}/.gvimrc; fi
if [ -f ${HOME}/.bash_profile ]; then /bin/rm -f ${HOME}/.bash_profile; fi
if [ -f ${HOME}/.bashrc ]; then /bin/rm -f ${HOME}/.bashrc; fi
if [ -f ${HOME}/.gitconfig ]; then /bin/rm -f ${HOME}/.gitconfig; fi
if [ -f ${HOME}/.gitignore ]; then /bin/rm -f ${HOME}/.gitignore; fi

ln -s ${HOME}/dotfiles/vim ${HOME}/.vim
ln -s ${HOME}/dotfiles/.vimrc ${HOME}/.vimrc
ln -s ${HOME}/dotfiles/.gvimrc ${HOME}/.gvimrc
ln -s ${HOME}/dotfiles/.bashrc ${HOME}/.bashrc
ln -s ${HOME}/dotfiles/.bash_profile ${HOME}/.bash_profile
ln -s ${HOME}/dotfiles/.gitconfig ${HOME}/.gitconfig
ln -s ${HOME}/dotfiles/.gitignore ${HOME}/.gitignore

