fpath=($HOME/.zsh/functions $HOME/.zsh/completions $fpath)
typeset -U fpath

# Setup PATH
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
export PATH=/usr/local/Cellar/macvim/7.3-64/MacVim.app/Contents/MacOS:$PATH
export PATH=/usr/local/share/python:$PATH
export PATH=/usr/local/share/npm/bin:$PATH
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH
export PATH=/usr/local/mysql/bin:$PATH
export PATH=/usr/local/git/bin:$PATH
export PATH=/usr/local/go/bin:$PATH
export PATH=/var/lib/gems/1.8/bin:$PATH
export PATH=$HOME/.emacs.d/bin:$PATH
export PATH="$HOME/.cask/bin:$PATH"
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/bin:$HOME/dotfiles/bin:$PATH
export PATH="$HOME/.cargo/bin:$PATH"
export PATH=$HOME/dev/esp/xtensa-esp32-elf/bin:$PATH

export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/shims:$PATH"

export ROQUA_ROOT=$HOME/work/code/deployer
export RAILS_LOG_LEVEL="debug"

export RUST_SRC_PATH=$HOME/src/rust

export PATH=$HOME/bin:$PATH

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export ANDROID_HOME=/usr/local/opt/android-sdk
export IDF_PATH=$HOME/dev/esp/esp-idf
export ERL_AFLAGS="-kernel shell_history enabled"

# https://stackoverflow.com/questions/52671926/rails-may-have-been-in-progress-in-another-thread-when-fork-was-called
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

export EDITOR=nvim

if (( $+commands[java_home] )) ; then
  export JAVA_HOME="$(/usr/libexec/java_home)"
fi
