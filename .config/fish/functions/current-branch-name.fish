# Defined in /home/jim/.config/fish/functions/current-branch-name.fish @ line 1
function current-branch-name
	git rev-parse --abbrev-ref HEAD ^ /dev/null
end
