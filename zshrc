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

# Rustup
[ -f $HOME/.cargo/env ] && source $HOME/.cargo/env

export PATH=/anaconda2/bin:$PATH

eval "$(zoxide init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(starship init zsh)"


# bun completions
[ -s "/Users/marten/.bun/_bun" ] && source "/Users/marten/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
