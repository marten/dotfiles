autoload -U colors
colors

setopt promptsubst
autoload -U promptinit
promptinit
prompt marten

# Automatically pushd
setopt autopushd

export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH
export MAKEFLAGS="-j8"
export EDITOR=vim

# Setup autojump if we have it (https://github.com/joelthelion/autojump/wiki/)
[[ -s /etc/profile.d/autojump.zsh ]]     && source /etc/profile.d/autojump.zsh
if [ -f /usr/local/etc/autojump ]; then
    . /usr/local/etc/autojump
fi

# Setup nvm if we have it
[[ -s "$HOME/.nvm/nvm.sh" ]] && source "$HOME/.nvm/nvm.sh"

# Setup my own bin as the first place to look
#export PATH=$HOME/bin:$PATH

function dburl() {
  dropbox puburl ~/Dropbox/Public/$1.png | pbcopy
}