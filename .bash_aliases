# My common folders
alias cdhairesis='cd $DEVDIR/business/hairesis'

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
