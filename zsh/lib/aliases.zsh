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

alias git-up="~/.rvm/wrappers/default/git-up"
alias datagrip="/usr/local/datagrip/bin/datagrip.sh"

alias beheer='sshuttle -r beheer11 10.128.0.0/9'

alias afind='ack-grep -il'
alias awssh="docker run -it --rm --volume $HOME/.ssh:/root/.ssh -e AWS_DEFAULT_REGION -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY -e AWS_SESSION_TOKEN -e AWS_SECURITY_TOKEN astopy/awssh"

alias psql='pgcli'
alias psql-panoptes-staging='psql -h panoptes-staging-new.cezuuccr9cw6.us-east-1.rds.amazonaws.com -U panoptes panoptes'
alias psql-panoptes-production='psql -h panoptes-production.cezuuccr9cw6.us-east-1.rds.amazonaws.com -U readonly panoptes'
alias psql-panoptes-slave='psql -h panoptes-production-read1.cezuuccr9cw6.us-east-1.rds.amazonaws.com -U readonly panoptes'

alias psql-talk-production='psql -h panoptes-microservices-production.cezuuccr9cw6.us-east-1.rds.amazonaws.com -U talk_production talk_production'

alias psql-edu-staging='psql -h microservices-staging.cezuuccr9cw6.us-east-1.rds.amazonaws.com -U education_staging education_staging'
alias psql-edu-production='psql -h microservices-production.cezuuccr9cw6.us-east-1.rds.amazonaws.com -U education_production education_production'

alias psql-caesar-staging='psql -h microservices-staging.cezuuccr9cw6.us-east-1.rds.amazonaws.com -U caesar_staging caesar_staging'
alias psql-caesar-production='psql -h microservices-production.cezuuccr9cw6.us-east-1.rds.amazonaws.com -U caesar_production caesar_production'

alias psql-nero-production='psql -h microservices-production.cezuuccr9cw6.us-east-1.rds.amazonaws.com -U nero nero'

alias psql-turk-production='psql -h microservices-production.cezuuccr9cw6.us-east-1.rds.amazonaws.com -U mechanical_zoo_production mechanical_zoo_production'

alias sas='hermes exec StandaloneAppsSwarm -- docker '
