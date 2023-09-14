# Push and pop directories on directory stack
alias pu='pushd'
alias po='popd'

# Basic directory operations
alias ...='cd ../..'
alias -- -='cd -'

# Super user
alias _='sudo'

#alias g='grep -in'

# Show history
alias history='fc -l 1'

# git
alias  g='git'
alias  gp='git pull --rebase'
alias gti=git

alias ping='prettyping'

# List direcory contents
alias lsa='ls -lah'
alias l='ls -la'
alias ll='ls -l'
alias sl=ls # often screw this up

alias e='emacsclient -nw'

alias beheer='sshuttle -r beheer11 10.128.0.0/9'

alias psql='pgcli'

alias vim='nvim'

alias lg=lazygit

alias pn=pnpm

# Simulate OSX's pbcopy and pbpaste on other platforms
if [ ! $(uname -s) = "Darwin" ]; then
    alias pbcopy='xsel --clipboard --input'
    alias pbpaste='xsel --clipboard --output'
fi
