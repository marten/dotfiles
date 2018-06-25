fpath=($HOME/.zsh/functions $HOME/.zsh/completions $fpath)
typeset -U fpath

# Setup PATH
export PATH=/usr/local/Cellar/macvim/7.3-64/MacVim.app/Contents/MacOS:$PATH
export PATH=/usr/local/share/python:$PATH
export PATH=/usr/local/share/npm/bin:$PATH
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH
export PATH=/usr/local/mysql/bin:$PATH
export PATH=/usr/local/git/bin:$PATH
export PATH=/usr/local/go/bin:$PATH
export PATH=/var/lib/gems/1.8/bin:$PATH
export PATH=/opt/vagrant/bin:$PATH
export PATH=/usr/local/spark-1.5.1-bin-hadoop2.6/bin:$PATH
export PATH=$HOME/.emacs.d/bin:$PATH
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export PATH=/anaconda2/bin:$PATH
export PATH="$HOME/.cask/bin:$PATH"
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/bin:$HOME/dotfiles/bin:$PATH
export PATH="$PATH:$HOME/src/xtensa-esp32-elf/bin"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH=$PATH:$HOME/dev/esp/xtensa-esp32-elf/bin

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$HOME/.rbenv/bin:$PATH"

export ROQUA_ROOT=$HOME/work/code/deployer
export RAILS_LOG_LEVEL="debug"

export PATH=$HOME/bin:$PATH

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export ANDROID_HOME=/usr/local/opt/android-sdk
export IDF_PATH=$HOME/dev/esp/esp-idf
export ERL_AFLAGS="-kernel shell_history enabled"

if (( $+commands[java_home] )) ; then
  export JAVA_HOME="$(/usr/libexec/java_home)"
fi

