# Defined in - @ line 1
function beheer --description 'alias beheer=sshuttle -r beheer11 10.128.0.0/9'
	sshuttle -r sshuttle 10.128.0.0/9 $argv;
end
