if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f ~/.bashrc ]; then
        . ~/.bashrc
    else
        . ~/.bash_aliases
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d ~/.bin ] ; then
    PATH="~/.bin:$PATH"
fi

if [ -d ~/.config/composer/vendor/bin ] ; then
    PATH="~/.config/composer/vendor/bin:$PATH"
fi

if [ -d ~/.symfony/bin ] ; then
    PATH="~/.symfony/bin:$PATH"
fi
