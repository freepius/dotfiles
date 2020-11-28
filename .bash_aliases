# Symfony aliases
alias sf='symfony console'
alias sfcc='sf cache:clear'
alias sfco='symfony composer'

# Meteo aliases
meteoWttr() {
    reset
    curl -4 http://wttr.in/$1
}
alias meteo=meteoWttr
alias meteoh='meteoWttr Désaignes'

# More aliases
alias ll='ls -al'
alias lL='ls -l'

# SSH aliases
alias myssh='ssh freepius@ssh-freepius.alwaysdata.net'

# Some very local aliases
if [ -f ~/.bash_aliases_local ]; then
    . ~/.bash_aliases_local
fi

if [ -f ~/.dotfiles/oh-my-git/prompt.sh ]; then
    . ~/.dotfiles/oh-my-git/prompt.sh
fi

if [ -f ~/.bin/wp-completion.bash ]; then
    . ~/.bin/wp-completion.bash
fi
