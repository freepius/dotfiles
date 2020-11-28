#!/bin/sh -e

# WARNING: Dont' forget to install git submodules!

DOTFILES=$(dirname $(readlink -f $0))

# Make links
if [ -L ~/.dotfiles ]; then
  rm ~/.dotfiles
fi
ln -s $DOTFILES ~/.dotfiles

LINKS=".bash_aliases .profile .global_gitignore .gitconfig .vimrc .fonts .vim"
for i in $LINKS; do
    if [ -L ~/$i ]; then
      rm ~/$i
    fi
    if [ -f ~/$i ]; then
        mv ~/$i ~/$i.bak
    fi
    ln -s $DOTFILES/$i ~/$i
done

# Awesome terminal fonts
cp $DOTFILES/awesome-terminal-fonts/patched/*.ttf ~/.fonts
fc-cache -fv ~/.fonts

# Vim
vim +:PluginUpdate +:qall

# SSH
mkdir -p ~/.ssh
cat $DOTFILES/id_rsa.pub >> ~/.ssh/authorized_keys
