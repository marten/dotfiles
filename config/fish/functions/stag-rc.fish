# Defined in - @ line 1
function stag-rc --wraps='cd ~/rgoc/ci-deployer && bin/deployer rails console --application roqua --environment staging' --description 'alias stag-rc=cd ~/rgoc/ci-deployer && bin/deployer rails console --application roqua --environment staging'
  cd ~/rgoc/ci-deployer && bin/deployer rails console --application roqua --environment staging $argv;
end
