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

alias git-up="~/.rvm/wrappers/default/git-up"

alias afind='ack-grep -il'

alias psql-panoptes-staging='psql -h panoptes-staging-new.cezuuccr9cw6.us-east-1.rds.amazonaws.com --user panoptes panoptes'
alias psql-panoptes-production='psql -h panoptes-production.cezuuccr9cw6.us-east-1.rds.amazonaws.com --user readonly panoptes'
alias psql-panoptes-slave='psql -h panoptes-production-read1.cezuuccr9cw6.us-east-1.rds.amazonaws.com --user readonly panoptes'

alias psql-edu-staging='psql -h microservices-staging.cezuuccr9cw6.us-east-1.rds.amazonaws.com --user education_staging education_staging'
alias psql-edu-production='psql -h microservices-production.cezuuccr9cw6.us-east-1.rds.amazonaws.com --user education_production education_production'

alias psql-caesar-staging='psql -h microservices-staging.cezuuccr9cw6.us-east-1.rds.amazonaws.com --user caesar_staging caesar_staging'
alias psql-caesar-production='psql -h microservices-production.cezuuccr9cw6.us-east-1.rds.amazonaws.com --user caesar_production caesar_production'

alias psql-nero-production='psql -h microservices-production.cezuuccr9cw6.us-east-1.rds.amazonaws.com --user nero nero'
