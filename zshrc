# shortcut to this dotfiles path is $ZSH
export ZSH=$HOME/dotfiles

# your project folder that we can `c [tab]` to
export PROJECTS=~/prj

# source every .zsh file in this rep
for config_file ($ZSH/**/*.zsh) source $config_file

# use .localrc for SUPER SECRET CRAP that you don't
# want in your public, versioned repo.
if [[ -a ~/.localrc ]]
then
  source ~/.localrc
fi

# initialize autocomplete here, otherwise functions won't be loaded
autoload -U compinit
compinit

# load every completion after autocomplete loads
for config_file ($ZSH/**/completion.sh) source $config_file

eval "$(rbenv init -)"
eval "$(direnv hook zsh)"

bindkey -e
bindkey '^[[1;9C' forward-word
bindkey '^[[1;9D' backward-word

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


export PATH=/anaconda2/bin:$PATH
# added by travis gem
[ -f /Users/marten/.travis/travis.sh ] && source /Users/marten/.travis/travis.sh

# added by travis gem
[ -f /home/marten/.travis/travis.sh ] && source /home/marten/.travis/travis.sh

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
