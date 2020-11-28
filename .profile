# set some directory shortcuts
DEVDIR="$HOME/AnarchosSemitas/Informatique/Current"

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.bin" ] ; then
    PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.config/composer/vendor/bin" ] ; then
    PATH="$HOME/.config/composer/vendor/bin:$PATH"
fi

if [ -d "$HOME/.symfony/bin" ] ; then
    PATH="$HOME/.symfony/bin:$PATH"
fi

source $DEVDIR/dotfiles/oh-my-git/prompt.sh
source $HOME/.bin/wp-completion.bash
