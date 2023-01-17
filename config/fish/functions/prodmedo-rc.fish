# Defined in - @ line 1
function prod-medorc --wraps='cd ~/rgoc/ci-deployer && bin/deployer rails console --application medo --environment production' --description 'alias prod-rc=cd ~/rgoc/ci-deployer && bin/deployer rails console --application medo --environment production'
  cd ~/rgoc/ci-deployer && bin/deployer rails console --application medo --environment production $argv;
end
