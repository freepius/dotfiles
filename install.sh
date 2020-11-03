#!/bin/sh -e

# WARNING: Dont' forget to install git submodules!

DOTFILES=$(dirname $(readlink -f $0))

# Make links
ln -s $DOTFILES ~/.dotfiles

LINKS=".global_gitignore .gitconfig .vimrc .fonts .vim"
for i in $LINKS; do
    ln -s $DOTFILES/$i ~/$i
done

# oh-my-git
cp $DOTFILES/awesome-terminal-fonts/patched/*.ttf ~/.fonts
echo "source $DOTFILES/oh-my-git/prompt.sh" >> ~/.bashrc
fc-cache -fv ~/.fonts

# Vim
vim +:PluginUpdate +:qall

# SSH
mkdir -p ~/.ssh
cat $DOTFILES/id_rsa.pub >> ~/.ssh/authorized_keys

# Meteo in .bashrc
echo "
meteoWttr() {
    reset
    curl -4 http://wttr.in/\$1
}
alias meteo=meteoWttr
alias meteoh='meteoWttr Mosset'" >> ~/.bashrc
