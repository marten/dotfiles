autoload -U colors
colors

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

# Setup my own bin as the first place to look
#export PATH=$HOME/bin:$PATH

function dburl() {
  dropbox puburl ~/Dropbox/Public/$1.png | pbcopy
}
