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

# List direcory contents
alias lsa='ls -lah'
alias l='ls -la'
alias ll='ls -l'
alias sl=ls # often screw this up

alias vim=nvim
alias vi=nvim
alias v=nvim
alias git-up="~/.rvm/wrappers/default/git-up"

alias afind='ack-grep -il'

alias psql-panoptes-staging='psql -h panoptes-staging-new.cezuuccr9cw6.us-east-1.rds.amazonaws.com --user panoptes panoptes'
alias psql-panoptes-production='psql -h panoptes-production.cezuuccr9cw6.us-east-1.rds.amazonaws.com --user readonly panoptes'
alias psql-edu-staging='psql -h education.cezuuccr9cw6.us-east-1.rds.amazonaws.com --user education_staging education_staging'
alias psql-edu-production='psql -h education.cezuuccr9cw6.us-east-1.rds.amazonaws.com --user education_production education_production'
