# Defined in - @ line 1
function dmzlan --description 'alias dmzlan=sshuttle -r rdmz 192.168.0.0/16'
	sshuttle -r sshuttle 192.168.0.0/16 $argv;
end
