# Defined in - @ line 1
function prod-rc --wraps='cd ~/rgoc/ci-deployer && bin/deployer rails console --application roqua --environment production' --description 'alias prod-rc=cd ~/rgoc/ci-deployer && bin/deployer rails console --application roqua --environment production'
  cd ~/rgoc/ci-deployer && bin/deployer rails console --application roqua --environment production $argv;
end
